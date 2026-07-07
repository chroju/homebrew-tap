#!/usr/bin/env python3
"""Update formulas to the latest GitHub release of each tool.

For every *.rb formula in the repository root, look up the latest
release of the source repository, and if it is newer than the version
in the formula, rewrite the version / url / sha256 lines. A formula is
only rewritten if every artifact of the new release can be downloaded,
so a partially published release never produces a half-updated formula.
"""
import hashlib
import json
import os
import re
import sys
import urllib.request
from pathlib import Path


def fetch(url: str, token: str | None) -> bytes:
    headers = {"User-Agent": "update-formulas"}
    if token and url.startswith("https://api.github.com/"):
        headers["Authorization"] = f"Bearer {token}"
    req = urllib.request.Request(url, headers=headers)
    with urllib.request.urlopen(req) as res:
        return res.read()


def main() -> int:
    token = os.environ.get("GITHUB_TOKEN")
    failed = False

    for rb in sorted(Path(__file__).resolve().parent.parent.glob("*.rb")):
        text = rb.read_text()
        m = re.search(r'github\.com/(chroju/[^/"]+)/releases/download/([^/"]+)/', text)
        if not m:
            print(f"{rb.name}: no release url found, skipping")
            continue
        repo, cur_tag = m.group(1), m.group(2)

        latest = json.loads(
            fetch(f"https://api.github.com/repos/{repo}/releases/latest", token)
        )["tag_name"]
        if latest == cur_tag:
            print(f"{rb.name}: up to date ({cur_tag})")
            continue

        cur_ver, new_ver = cur_tag.lstrip("v"), latest.lstrip("v")
        new_text = text
        ok = True
        for um in re.finditer(r'url "([^"]+)"\s*\n\s*sha256 "([0-9a-f]{64})"', text):
            old_url, old_sha = um.group(1), um.group(2)
            new_url = old_url.replace(f"/{cur_tag}/", f"/{latest}/").replace(
                f"_{cur_ver}_", f"_{new_ver}_"
            )
            try:
                digest = hashlib.sha256(fetch(new_url, token)).hexdigest()
            except Exception as e:
                print(f"{rb.name}: artifact not available, skipping: {new_url} ({e})")
                ok = False
                break
            new_text = new_text.replace(f'url "{old_url}"', f'url "{new_url}"')
            new_text = new_text.replace(old_sha, digest)
        if not ok:
            failed = True
            continue

        new_text = new_text.replace(f'version "{cur_ver}"', f'version "{new_ver}"')
        rb.write_text(new_text)
        print(f"{rb.name}: {cur_tag} -> {latest}")

    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())

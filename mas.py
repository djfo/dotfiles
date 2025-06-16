#!/usr/bin/env python3
import subprocess
apps = [
  (1586435171, "Actions")
]
for (appid, _) in apps:
  subprocess.run(["mas", "install", str(appid)])

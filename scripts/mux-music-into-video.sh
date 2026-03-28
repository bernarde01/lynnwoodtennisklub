#!/usr/bin/env bash
# Mix a music track into an MP4 (replaces original audio). Requires ffmpeg.
# Use only music you have the right to use (e.g. royalty-free / your own).
#
# Usage:
#   chmod +x scripts/mux-music-into-video.sh
#   ./scripts/mux-music-into-video.sh path/to/your-music.mp3
#
# Outputs go to Images/ with suffix -with-music.mp4 (edit OUTPUT names as needed).

set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if [[ $# -lt 1 ]] || [[ ! -f "$1" ]]; then
  echo "Usage: $0 <music-file.mp3-or-m4a>"
  echo "Example: $0 ~/Music/royalty-free-bed.mp3"
  exit 1
fi

MUSIC="$1"
V1="Images/WhatsApp Video 2026-03-08 at 20.39.30.mp4"
V2="Images/WhatsApp Video 2026-03-08 at 20.39.37.mp4"

for V in "$V1" "$V2"; do
  if [[ ! -f "$V" ]]; then
    echo "Skip (not found): $V"
    continue
  fi
  BASE="${V%.mp4}"
  OUT="${BASE}-with-music.mp4"
  echo "Creating: $OUT"
  ffmpeg -y -i "$V" -i "$MUSIC" \
    -map 0:v:0 -map 1:a:0 \
    -c:v copy -c:a aac -b:a 192k \
    -shortest \
    "$OUT"
done

echo "Done. Update index.html video src paths to the new *-with-music.mp4 files when you are happy with the result."

# Lynnwood Tennisklub – Website

A simple static website for club visibility and contact details.

## Stack

- **HTML** – Single page with sections: Hero, About, Facilities, Contact
- **CSS** – Black & white theme, responsive layout, no build step
- **Logo** – Uses `Logo.png` from this folder

No JavaScript frameworks or build tools. Open `index.html` in a browser or host the folder on any static host (e.g. Netlify, GitHub Pages, or your own server).

## Updating the site

1. **Contact details** – Edit the Contact section in `index.html`: replace the placeholder email, phone, and address with your real details. Remove the “Update the email…” note when done.

2. **Adding facility photos** – Place your images in this folder (or an `images` subfolder). In `index.html`, replace the three “Photo coming soon” placeholder cards with `<img>` tags, for example:
   ```html
   <div class="facility-card">
     <img src="your-photo.jpg" alt="Description of the facility">
   </div>
   ```
   Photos will automatically fill the cards (styling is already in `styles.css`).

3. **About text** – Edit the paragraphs in the About section in `index.html` to match your club.

## Running locally

Double-click `index.html` or run a simple server, e.g.:

```bash
# Python 3
python3 -m http.server 8000

# Then open http://localhost:8000
```

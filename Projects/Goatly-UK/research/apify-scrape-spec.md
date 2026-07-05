---
type: research-spec
status: ready-to-run
project: Goatly-UK
date: 2026-06-24
tags: [goatly, uk, apify, scrape, voc, spec]
---

> [!tip] What this is
> A ready-to-run Apify config to fill the last real gaps that Reddit and Amazon walls blocked: the **goat-milk taste/perception voice**, the **Osteocare/AdCal "made no difference" + GI complaints** at volume, and the **Reddit avatar voices**. [[me|Talat]] runs it on his own Apify account (I cannot run paid services or enter payment). Export the results as JSON and paste or drop them back to me, I extract them straight into [[uk-language-bank]] and [[uk-voc-absorption-and-goatmilk]].

## The 3 Apify actors (search these names in the Apify Store)

| Job | Actor | Link |
|---|---|---|
| Amazon reviews | Amazon Reviews Scraper (axesso_data) | apify.com/axesso_data/amazon-reviews-scraper |
| Reddit posts + comments | Reddit Scraper (automation-lab) | apify.com/automation-lab/reddit-scraper |
| Trustpilot reviews | Trustpilot Reviews Scraper (automation-lab) | apify.com/automation-lab/trustpilot |

Field names differ slightly per actor. The Apify "Input" tab shows the schema. Below is the intent + the targets. Map the targets into each actor's input panel (most accept full URLs or ASINs).

---

## JOB 1: Amazon.co.uk reviews

**Settings to set in the UI:**
- Marketplace / domain: **co.uk** (critical, UK voices only)
- Max reviews per product: **500 to 1000**
- Sort: run **Most recent** AND **Most helpful** (or do two runs)
- Star filter: **all stars**, but make sure 1 to 3 star are included (that is where "did nothing" and GI complaints live)

### A. Bone-health incumbents (fills [Pill] disappointment + GI at volume)
Grab these on Amazon.co.uk. Search the product, open it, copy the ASIN from the URL (the B0... code):
- **Vitabiotics Osteocare Original** (the prize, UK No.1): ASINs `B085BMJ838`, `B017A4CHCM`, plus search "osteocare original 90 tablets" and add the 90-pack listing (most reviews). [search](https://www.amazon.co.uk/osteocare/s?k=osteocare)
- **Osteocare Chewable**: `B01BKOHGY2` (chewable = the "chalky/disgusting" taste complaints)
- **AdCal-D3**: search ["adcal d3" on Amazon.co.uk](https://www.amazon.co.uk/s?k=adcal+d3), grab the ASIN
- **Calcichew-D3 Forte**: search ["calcichew d3 forte"](https://www.amazon.co.uk/s?k=calcichew+d3+forte), grab the ASIN
- **Accrete D3 / AdCal** (optional, more volume)

### B. Goat milk (fills the perception gap, taste/smell/"for babies?")
- **St Helen's Farm Fresh Whole Goats Milk**: `B007T5LNGO` (taste perception, adult use)
- **St Helen's Farm Goats Milk Yoghurt**: `B0B89LS3XT`
- **Goat milk POWDER**: search ["goats milk powder" on Amazon.co.uk](https://www.amazon.co.uk/goats-milk/s?k=goats+milk+powder), grab the top 5 to 8 ASINs (brands like Hoosier Hill Farm, Delamere, etc). Note: NANNYcare is infant formula, include it but tag it, since the "goat milk = babies" association is exactly what we are testing.

**Example input (axesso shape, adjust field names to the panel):**
```json
{
  "input": [
    { "asin": "B085BMJ838", "domainCode": "co.uk", "sortBy": "recent", "maxPages": 30, "filterByStar": "all_stars" },
    { "asin": "B01BKOHGY2", "domainCode": "co.uk", "sortBy": "recent", "maxPages": 30, "filterByStar": "all_stars" },
    { "asin": "B007T5LNGO", "domainCode": "co.uk", "sortBy": "recent", "maxPages": 30, "filterByStar": "all_stars" }
  ]
}
```

---

## JOB 2: Reddit (fills avatar voices Reddit-walled to me)

**Subreddits (startUrls):**
- https://www.reddit.com/r/osteoporosis/
- https://www.reddit.com/r/Menopause/
- https://www.reddit.com/r/PostMenopause/

**Search queries (run these too):**
`osteoporosis diagnosed`, `osteopenia scared`, `calcium not working`, `DEXA scan worse`, `bisphosphonates side effects`, `lost height shrinking`, `goat milk bones`, `dont want to take the medication`

**Settings:** sort `top`, time `all` + `year`; maxItems ~2000; include comments (maxComments 30 to 50). Comments are where the emotional gold sits.

**Example input (adjust to panel):**
```json
{
  "startUrls": [
    { "url": "https://www.reddit.com/r/osteoporosis/top/?t=all" },
    { "url": "https://www.reddit.com/r/Menopause/search/?q=bones+osteoporosis" }
  ],
  "searches": ["osteoporosis diagnosed scared", "calcium not working DEXA", "goat milk bones menopause"],
  "sort": "top",
  "time": "all",
  "maxItems": 2000,
  "maxComments": 40,
  "proxy": { "useApifyProxy": true }
}
```

---

## JOB 3: Trustpilot (incumbent + goat brand sentiment)

**Company pages:**
- https://www.trustpilot.com/review/www.vitabiotics.com (Osteocare maker)
- https://www.trustpilot.com/review/sthelensfarm.co.uk (goat milk brand)

**Settings:** all reviews, all star ratings.

---

## Cost (rough)
- Amazon: ~$0.5 to 2 per 1000 reviews. ~5000 reviews = a few euro.
- Reddit: ~$1.15 per 1000 posts / $0.58 per 1000 comments at free tier. ~2000 posts + comments = a few euro.
- Trustpilot: small.
- Apify free tier includes ~$5 monthly credit. **Full "best of the best" pull realistically €20 to 40.**

## Return loop
Export each run as **JSON** (Apify: Dataset, "Export", JSON). Paste it here, or save the files into `Projects/Goatly-UK/research/raw/` and tell me. I then:
1. Extract verbatim quotes into [[uk-language-bank]] (per avatar), no fabrication.
2. Fill the goat-milk taste/perception section of [[uk-voc-absorption-and-goatmilk]].
3. Flag the strongest new ad-copy lines.

## BATCH 2 (run 2026-06-24, €30 budget): paste-ready

### Amazon batch 2 (paste into the Amazon Reviews Scraper, replace input, Start)
New products only (batch 1 already did B085BMJ838 Osteocare Formula, B01BKOHGY2 Chewable, B007T5LNGO goat milk). Includes goat milk POWDER (Nannycare) for the perception gap.
```json
[
  { "asin": "B00KOQQ568", "domainCode": "co.uk", "sortBy": "recent", "maxPages": 30, "filterByStar": "all_stars", "reviewerType": "all_reviews", "formatType": "all_formats", "mediaType": "all_contents" },
  { "asin": "B001CMJVTG", "domainCode": "co.uk", "sortBy": "recent", "maxPages": 30, "filterByStar": "all_stars", "reviewerType": "all_reviews", "formatType": "all_formats", "mediaType": "all_contents" },
  { "asin": "B08JWHCCM7", "domainCode": "co.uk", "sortBy": "recent", "maxPages": 30, "filterByStar": "all_stars", "reviewerType": "all_reviews", "formatType": "all_formats", "mediaType": "all_contents" },
  { "asin": "B08JWHR38Y", "domainCode": "co.uk", "sortBy": "recent", "maxPages": 30, "filterByStar": "all_stars", "reviewerType": "all_reviews", "formatType": "all_formats", "mediaType": "all_contents" },
  { "asin": "B08JWCNWDX", "domainCode": "co.uk", "sortBy": "recent", "maxPages": 30, "filterByStar": "all_stars", "reviewerType": "all_reviews", "formatType": "all_formats", "mediaType": "all_contents" },
  { "asin": "B00TA409GW", "domainCode": "co.uk", "sortBy": "recent", "maxPages": 30, "filterByStar": "all_stars", "reviewerType": "all_reviews", "formatType": "all_formats", "mediaType": "all_contents" },
  { "asin": "B0B89LS3XT", "domainCode": "co.uk", "sortBy": "recent", "maxPages": 30, "filterByStar": "all_stars", "reviewerType": "all_reviews", "formatType": "all_formats", "mediaType": "all_contents" }
]
```
Product key: B00KOQQ568 Osteocare 30s, B001CMJVTG Osteocare Plus, B08JWHCCM7 + B08JWHR38Y Nannycare goat POWDER, B08JWCNWDX Nannycare infant POWDER, B00TA409GW Delamere goat milk, B0B89LS3XT St Helen's goat yoghurt.
Optional add AdCal (7296 reviews) + Calcichew: open [adcal search](https://www.amazon.co.uk/adcal-d3/s?k=adcal+d3) and [calcichew search](https://www.amazon.co.uk/calcichew-d3-forte/s?k=calcichew+d3+forte), click the main product, copy the B0... code from the URL, add 2 more lines.

### Reddit (actor automation-lab/reddit-scraper): where the €30 volume goes
```json
{
  "startUrls": [
    { "url": "https://www.reddit.com/r/osteoporosis/top/?t=all" },
    { "url": "https://www.reddit.com/r/osteoporosis/top/?t=year" },
    { "url": "https://www.reddit.com/r/Menopause/" }
  ],
  "searches": ["osteoporosis diagnosed", "osteopenia scared", "DEXA scan results", "calcium supplement bones", "bisphosphonates side effects", "lost height shrinking", "goat milk bones"],
  "maxItems": 4000,
  "maxComments": 40,
  "proxy": { "useApifyProxy": true }
}
```

### Trustpilot (actor automation-lab/trustpilot): optional
Run once per URL: `https://www.trustpilot.com/review/www.vitabiotics.com` and `https://www.trustpilot.com/review/sthelensfarm.co.uk`.

Budget check: Amazon ~€1, Reddit ~€3 to 6, Trustpilot ~€1. Well under €30.

## What each job uniquely unlocks
- **Amazon goat milk + Trustpilot** = the only real path to UK adult goat-milk taste sentiment (the one gap HealthUnlocked/Mumsnet cannot fill).
- **Amazon Osteocare/AdCal** = the "made no difference / chalky / constipation" disappointment at scale, for the [Pill] avatar.
- **Reddit** = the avatar voices behind the safety wall, especially r/Menopause for the perimenopausal preventer.

# Your first data + graph (hands-on)

**Idea:** Use **public data** (no login, no payment), turn it into a small table, and make a **graph**—the kind that could go in a policy brief.

---

## Option A — In Cursor with Python (recommended to try once)

1. **Open the project in Cursor** (you already did in Quick start).

2. **Install Python** (if needed): [python.org/downloads](https://www.python.org/downloads/) — use “Add Python to PATH” when installing.

3. In Cursor, open the folder `SHREYA-LEARNING-DAY`. You’ll see:
   - `data/` — a sample CSV (e.g. state-level stats) so the script runs immediately.
   - `scripts/` — a short Python script that reads the CSV and makes a graph.

4. **Run the script:**
   - Open `scripts/plot_public_data.py` in Cursor.
   - Use Cursor’s terminal: **Terminal → New Terminal**.
   - Run:

   ```bash
   cd SHREYA-LEARNING-DAY
   pip install pandas matplotlib
   python scripts/plot_public_data.py
   ```

   - A graph image should appear (e.g. saved in the folder or shown in a viewer).

5. **Change something:** Edit the CSV in `data/` (e.g. change a number or add a row) and run the script again. Then try asking Cursor: “Change the graph to use a bar chart” or “Add a title that says ‘Education and equity’.”

---

## Option B — Same idea in Google Sheets

1. Go to [data.gov](https://data.gov) or [CDC Data](https://data.cdc.gov) and pick a small dataset (e.g. by state or year).

2. Download as CSV. In Google Sheets: **File → Import** and upload the CSV.

3. Select the columns you care about, then **Insert → Chart**. Choose a bar or line chart.

4. You’ve just done “data + graph” without code. Later you can do the same kind of thing in Python when you want to automate or do harder stats.

---

## Public data ideas that fit policy/justice

- State-level education spending or outcomes  
- Health or vaccination rates by county/state  
- Crime or incarceration statistics (use official sources)  
- Voter turnout or demographic data (e.g. from Census)

---

← [Back to index](../README.md) · Prev: [Why data & AI matter](03-why-data-ai-policy.md) · Next: [Using Cursor](05-using-cursor.md) →

"""
Read sample state education data (CSV) and plot a simple graph.
Run from SHREYA-LEARNING-DAY folder: python scripts/plot_public_data.py
"""
import pandas as pd
import matplotlib.pyplot as plt
from pathlib import Path

# Path to the CSV (works when run from repo root or from SHREYA-LEARNING-DAY)
base = Path(__file__).resolve().parent.parent
csv_path = base / "data" / "sample_state_education.csv"
out_path = base / "output_graph.png"

df = pd.read_csv(csv_path)

fig, ax = plt.subplots(figsize=(10, 5))
ax.bar(df["state"], df["graduation_rate_pct"], color="steelblue", edgecolor="black", linewidth=0.5)
ax.set_xlabel("State")
ax.set_ylabel("Graduation rate (%)")
ax.set_title("High school graduation rate by state (sample data)")
plt.xticks(rotation=45, ha="right")
plt.tight_layout()
plt.savefig(out_path, dpi=150)
print(f"Graph saved to: {out_path}")
plt.show()

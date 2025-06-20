
# 📈 Apple Stock Price Analysis (1981–2023)

## 🧠 Project Overview

This project analyzes Apple Inc. (AAPL) stock prices from 1981 to 2023 using Python tools such as Pandas, NumPy, Matplotlib, and SciPy. The notebook demonstrates a full workflow of financial data analysis, including time series exploration, visualization, statistical summaries, hypothesis testing, and advanced signal processing.

This analysis helps uncover long-term trends, relationships between volume and price, and the statistical nature of Apple’s daily returns — all crucial for making informed investment decisions.

## 📁 Dataset

- **Source**: Historical Apple stock prices (CSV)
- **Columns**:
  - `Date`: Trading date
  - `Open`, `High`, `Low`, `Close`: Daily stock prices
  - `Adj Close`: Adjusted for splits and dividends
  - `Volume`: Number of shares traded

## 📊 Key Analyses Performed

1. **Initial Data Exploration**  
   - Checked for nulls and corrected data types
   - Converted date strings to `datetime` format for time series analysis

2. **Data Visualization**  
   - Plotted closing prices and traded volume over time  
   - Generated candlestick charts using `mplfinance`

3. **Statistical Analysis**  
   - Computed summary statistics (mean, median, std)  
   - Added 50-day and 200-day moving averages

4. **Hypothesis Testing**  
   - Compared average closing prices between 2000 and 2020 using a t-test  
   - Tested for normality of daily returns using SciPy

5. **Advanced Techniques (Bonus)**  
   - Used NumPy’s `convolve` to compute efficient moving averages  
   - Analyzed correlation between volume and price movements

## 🛠️ How to Run the Analysis

### ✅ Option 1: Google Colab

1. Upload the dataset (`Apple Stock Prices (1981 to 2023).csv`)
2. Upload and open the notebook `Mini Project.ipynb`
3. Run each cell in order

> The notebook is preloaded with all analysis, plots, and comments.

### ✅ Option 2: Local Jupyter Notebook

1. Clone the repository  
   ```bash
   git clone https://github.com/your-username/apple-stock-analysis.git
   cd apple-stock-analysis
   ```

2. Install dependencies  
   ```bash
   pip install pandas numpy matplotlib seaborn scipy mplfinance
   ```

3. Launch the notebook  
   ```bash
   jupyter notebook Mini\ Project.ipynb
   ```

## 📌 Deliverables

- `Mini Project.ipynb` — Full analysis notebook
- `README.md` — Project summary and usage
- `aapl_cleaned.csv` — Cleaned dataset (optional export)
- Visualizations and statistical findings embedded in the notebook

## 🧠 Author Reflection

This project enhanced my understanding of time series analysis, hypothesis testing, and the relationship between statistical tools and financial decision-making. The biggest learning curve was handling large date-indexed data for visualization, which was solved by using aggregation and efficient NumPy functions.

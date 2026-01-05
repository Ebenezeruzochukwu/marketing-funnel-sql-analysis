# Marketing Funnel SQL Analysis

## Overview
This project analyzes user behavior and conversion funnels for a marketing agency using SQL Server. It simulates real-life messy marketing data, cleans it, and prepares Power BI-ready tables for visualization. The goal is to understand user drop-offs, conversion rates, and which channels or devices perform best in driving users to purchase.

---

## Folder Structure

- `01_database_setup/` → Database creation and raw data insertion  
    - `01_create_tables.sql` → Creates Users and Events tables  
    - `02_insert_data.sql` → Inserts raw, messy dataset of 1000+ users/events  

- `02_data_exploration/` → Exploration of raw data before cleaning  
    - `01_event_distribution.sql` → Event counts by type, state, channel, device  
    - `02_user_activity_check.sql` → Checks user activity at each funnel stage  

- `03_funnel_analysis/` → Funnel building and analysis  
    - `01_build_funnel_view.sql` → Creates `vw_funnel_valid` view with funnel stages  
    - `02_funnel_counts.sql` → Counts users at each funnel stage  
    - `03_conversion_rates.sql` → Calculates conversion rates between stages  
    - `04_drop_off_overall.sql` → Overall drop-offs per stage  
    - `05_drop_off_by_channel.sql` → Drop-offs aggregated by acquisition channel  
    - `06_drop_off_by_device.sql` → Drop-offs aggregated by device type  
    - `07_funnel_clean_table.sql` → Creates final `funnel_clean` table for Power BI  

- `04_powerbi/` → Power BI-ready aggregation queries  
    - `01_funnel_counts.sql` → Overall funnel counts  
    - `02_conversion_rates.sql` → Funnel conversion rates  
    - `03_drop_offs.sql` → Funnel drop-offs  
    - `04_funnel_by_channel.sql` → Funnel counts by acquisition channel  
    - `05_funnel_by_device.sql` → Funnel counts by device type  

---

## Key Features

- User-level funnel table with drop-off flags  
- Conversion rates at each funnel step  
- Drop-offs overall, by marketing channel, and by device type  
- Fully ready for Power BI visualization  
- Simulates real-life messy marketing data to mimic realistic challenges  

---

## How to Use

1. **Set up the database**:  
   - Run all scripts in `01_database_setup/` in SQL Server Management Studio (SSMS) to create tables and insert raw data.  

2. **Explore the data**:  
   - Use scripts in `02_data_exploration/` to understand distributions and identify any missing or messy events.  

3. **Build the funnel**:  
   - Run `03_funnel_analysis/01_build_funnel_view.sql` to create the main funnel view.  
   - Run remaining scripts in `03_funnel_analysis/` to calculate funnel counts, conversion rates, and drop-offs.  
   - `03_funnel_analysis/07_funnel_clean_table.sql` will create a clean table ready for Power BI.  

4. **Power BI analysis**:  
   - Connect Power BI to your SQL Server database.  
   - Use scripts in `04_powerbi/` to create visualizations: funnel charts, KPIs, drop-off analysis by channel and device.  

---

## Insights You Can Derive

- Stage-by-stage funnel conversion rates  
- Drop-offs per funnel step to identify friction points  
- Comparison of acquisition channels and devices for user engagement  
- Identify opportunities to optimize the funnel  

---

## Author

**Ebenezer Uzochukwu**  
Data Analyst | SQL & Power BI Enthusiast | Portfolio-ready Marketing Funnel Project  

---

## License

This project is licensed under the MIT License.

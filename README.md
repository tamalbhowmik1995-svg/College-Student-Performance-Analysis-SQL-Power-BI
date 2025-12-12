1. Project Overview
This project aims to analyze the relationships between college demographics, student engagement with edtech platforms, and overall academic performance. The analysis utilizes data from four key tables (`college`, `student`, `edtech`, and `performance`) and employs SQL for data manipulation and analysis, followed by Power BI for interactive visualization and reporting.

The main objectives are to:
*   Identify key factors influencing student performance.
*   Track engagement trends across different colleges and demographics.
*   Provide actionable insights for educators and administrators to make informed decisions.

## 2. Data Sources
The analysis is based on four relational tables. The raw data files are located in the `data/raw/` directory.

*   **`college`**: Contains college-specific information (e.g., name, location, type).
*   **`student`**: Contains student demographic and enrollment details (e.g., student ID, age, gender, major).
*   **`edtech`**: Contains data on student interaction with educational technology platforms (e.g., login frequency, course completion rates).
*   **`performance`**: Contains academic performance metrics (e.g., grades, GPA, exam scores).

## 3. Tools & Technologies
The following tools were used for this project:

*   **SQL (e.g., MySQL, PostgreSQL, SQL Server)**: Used for data cleaning, transformation, joining the four tables, and initial analysis.
*   **Power BI Desktop**: Used for data modeling, creating an interactive dashboard, and visualizing key insights.
*   **Markdown**: Used for writing this README file.

## 4. Project Structure
The repository is organized as follows:

*   `data/`:
    *   `raw/`: Original source data files (e.g., CSV, Excel).
    *   `processed/`: Cleaned and transformed data files (output from SQL, ready for Power BI import).
*   `sql/`:
    *   `schema.sql`: SQL script for creating the database schema and tables.
    *   `queries.sql`: SQL queries used for data cleaning, transformation, and analysis.
*   `power_bi/`:
    *   `Performance_Dashboard.pbix`: The main Power BI project file containing the data model and interactive dashboards.
    *   `Performance_Dashboard.pdf`: A static PDF export of the final Power BI dashboard for quick viewing.
*   `README.md`: This explanatory guide.

## 5. Setup & Usage
To run or explore this project locally:

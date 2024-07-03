# Soccer-kit-Management-System

Welcome to the Soccer Kit Management System repository. This project offers a database solution aimed at efficiently managing soccer kit distribution and tracking within small football clubs. The system enhances resource management by optimizing kit usage and reducing operational costs.

## Files in this Repository

- `Database_Report.pdf`: Detailed report outlining the rationale, analysis, and implementation of the Soccer Kit Management System.
- `ER Diagram.png`: Entity Relationship (ER) diagram illustrating the structure and relationships of database entities.
- `Logical.png`: Logical model diagram depicting the database schema and entity relationships.
- `Normalization2.xlsx`: Document detailing the normalization process applied to ensure data integrity and efficiency.
- `README.md`: This file; provides an overview of the repository and its contents.
- `kit-DB&queries.sql`: SQL file containing Data Definition Language (DDL) and Data Manipulation Language (DML) statements for database creation, population, and queries.

## Project Overview

### Introduction

In the realm of soccer, effective management of resources such as soccer kits is critical for small clubs. Mismanagement can lead to financial strain. This project addresses these challenges by proposing a database-driven solution tailored to track and manage the distribution of soccer kits within grassroots football clubs.

### Features

- **Logical Model**: Diagram illustrating the entities and their relationships in the database.
- **ER Diagram**: Visual representation of the database structure.
- **Normalization**: Detailed process of organizing data to minimize redundancy and dependency issues.
- **Implementation and Outputs**: SQL scripts for creating tables, populating data, and executing queries.
- **Security and Governance**: Discussion on data security measures, integrity, and ethical considerations in database management.

### Implementation Details

#### Tools Required

To execute this project, you will need the following tools:

- **Oracle Data Modeler**: Used to create the logical and ER diagrams of the database schema.
- **Oracle SQL Developer**: To host and manage the Oracle SQL Server database.
- **MySQL Workbench**: Optional tool for practice and experimentation with MySQL databases.
- **Analytical Tools**: Required for conducting research and analysis on soccer kit management practices.

#### Tables Created

1. **Coach**
   - Stores information about coaches, including their roles and managed divisions.

2. **Brand**
   - Contains details about kit brands, including contact information.

3. **Division**
   - Stores information about different divisions within the organization, including training grounds and division managers.

4. **Kit**
   - Holds data about various soccer kits, including their names and associated brands.

5. **Player**
   - Contains information about players, including their names, positions, and divisions.

6. **Assign**
   - Tracks the assignment of kits to players, including quantities, statuses, and assignment dates.

#### Queries Executed

Example queries to retrieve information:

- Retrieve all brands and their details.
- Fetch kits along with their associated brands.
- Retrieve player assignments with detailed kit information.
- Get coach details along with the divisions they manage.

### Security and Governance

Measures implemented to ensure:

- **Data Security**: Protection of sensitive information within the system.
- **Data Integrity**: Maintenance of accurate and reliable data.
- **Ethical Considerations**: Adherence to ethical standards in database management.

### Conclusion

The Soccer Kit Management System project aims to streamline operations and optimize resource allocation within football clubs. This repository provides comprehensive documentation and SQL scripts to understand and replicate the database system.

For detailed insights, refer to the provided PDF report, diagrams, and SQL script files.

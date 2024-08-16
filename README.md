# Smart Restroom Hygiene System

## Overview
The Smart Restroom Hygiene System is an innovative IoT-driven solution designed to revolutionize restroom cleanliness monitoring. Utilizing real-time odour detection and advanced machine learning algorithms for air quality analysis, this system offers a comprehensive approach to maintaining high hygiene standards.

## Technologies Used
- **Python**: For scripting and backend logic.
- **Django**: For web application development.
- **Rest APIs**: For seamless data communication between components.
- **Bootstrap**: For responsive and user-friendly frontend design.

## Key Features
- **IoT Sensors**: Real-time odour detection to assess restroom cleanliness.
- **Machine Learning**: Advanced algorithms to analyze air quality and predict hygiene levels.
- **Web Interface**: Intuitive dashboard for real-time monitoring and alerts.

## Screenshots
![Dashboard](https://github.com/VishalMadle13/smrr/blob/main/Screenshot01.png)
![UI](https://github.com/VishalMadle13/smrr/blob/main/Screenshot02.png)
![UI](https://github.com/VishalMadle13/smrr/blob/main/Screenshot03.png)
![UI](https://github.com/VishalMadle13/smrr/blob/main/Screenshot04.png)

## Source Code
![Code](https://github.com/VishalMadle13/smrr/blob/main/source_code.png)

## Installation

### Local Setup
To set up and run the Smart Restroom Hygiene System locally, follow these steps:

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/vishalmadle13/smrr.git
   cd smrr
   ```
2. **Create a Virtual Environment:**
 ``` 
python -m venv smrrVenv
source venv/bin/activate
# On Windows, use `venv\Scripts\activate`
 ```

3. **Install Dependencies:**
 ```  
pip install -r requirements.txt
 ```
4. **Set Up the Database:**
 ```
python manage.py migrate
 ```
5.**Run the Development Server:**

 ```
python manage.py runserver
 ```
6.**Access the Web Interface:**
Open your web browser and navigate to http://127.0.0.1:8000/.

1.**Docker Setup**
To build and run the Smart Restroom Hygiene System using Docker, follow these steps:

2.**Build the Docker Image:**
 ```
docker-compose build
 ```
3.**Run the Docker Container:**
 ```
docker-compose up -d  
 ```
4.**Stop the contained:**
```
docker-compose down 
```

5.**Access the Web Interface:**
Open your web browser and navigate to http://localhost:8000/.

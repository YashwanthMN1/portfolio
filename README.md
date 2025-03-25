# FastAPI Portfolio

This is a simple portfolio built with [FastAPI](https://fastapi.tiangolo.com/) that serves an HTML resume (`index.html`). It is designed to be a single-page application where visitors can view your resume and contact details.

## Project Structure
```
portfolio/
├── main.py              # FastAPI application
└── static/             # Folder for static files 
    └── index.html      #  your resume

```
- `main.py`: This is the FastAPI application that serves the `index.html` file as the main route (`/`).
- `index.html`: Your resume in HTML format, which will be displayed when visiting the root URL of the application.
- `static/`: A directory for any static assets, like images or CSS files (optional).

## Setup

### Prerequisites

Python 3.7+
[FastAPI](https://fastapi.tiangolo.com/)
[Uvicorn](https://www.uvicorn.org/) (ASGI server to run FastAPI)

### Installation

1. Clone the repository or download the project files.

   ```bash
   git clone https://github.com/your-username/fastapi-portfolio.git
   cd fastapi-portfolio
   ```

2. Create a virtual environment (optional but recommended):

   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows, use: venv\Scripts\activate
   ```

3. Install the required dependencies:

   ```bash
   pip install -r requirements.txt
   ```

   If you don't have a `requirements.txt` file, you can install FastAPI and Uvicorn directly:

   ```bash
   pip install fastapi uvicorn
   ```

### Running the Application

To start the FastAPI application, run the following command:

```bash
uvicorn app:app --reload
```



### Optional: Adding Styling

To enhance your resume’s appearance, you can add a `style.css` file inside the `static/` folder. This CSS file can be linked in the `index.html` file.

### Contact Information

Feel free to modify the `index.html` file to update your personal details, skills, experience, and contact information.


# שימוש בתמונת בסיס רשמית וקלילה של Python
FROM python:3.9-slim

# הגדרת תיקיית העבודה בתוך הקונטיינר
WORKDIR /app

# העתקת קובץ הדרישות והתקנת התלויות
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# העתקת שאר קבצי הפרויקט לתיקיית העבודה
COPY . .

# חשיפת הפורט עליו רצה אפליקציית ה-Flask (בדרך כלל 5000)
EXPOSE 5000

# פקודת ההפעלה של האפליקציה
CMD ["python", "app.py"]

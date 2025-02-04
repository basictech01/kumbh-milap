from flask import Flask
from utils.extensions import bcrypt, jwt


from utils.logging import setup_logging
from routes.user import user

app = Flask(__name__)
app.register_blueprint(user, url_prefix='/user')
app.config["JWT_SECRET_KEY"] = "supersecretkey"

bcrypt = bcrypt.init_app(app)
jwt = jwt.init_app(app)

@app.route('/')
def index():
    return "Hello World!"


if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=5001)


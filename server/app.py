from flask import Flask

from routes.auth import auth
from routes.profile import profile
from routes.swipe import swipe
from utils.extensions import bcrypt, jwt
from utils.logging import setup_logging

app = Flask(__name__)
app.config["JWT_SECRET_KEY"] = "supersecretkey"
app.config["JWT_ACCESS_TOKEN_EXPIRES"] = 86400
app.config["JWT_REFRESH_TOKEN_EXPIRES"] = 365 * 24 * 60 * 60
app.config["JWT_VERIFY_SUB"]=False

app.register_blueprint(auth, url_prefix="/auth")
app.register_blueprint(profile, url_prefix="/profile")
app.register_blueprint(swipe, url_prefix="/swipe")

bcrypt = bcrypt.init_app(app)
jwt.init_app(app)


@app.route("/")
def index():
    return "Hello World!"


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=3001)

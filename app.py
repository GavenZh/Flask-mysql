#flask框架运行文件
from flask import Flask, render_template

app = Flask(__name__)


@app.route('/')
def anc():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(debug=True)

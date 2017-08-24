from flask import Flask, render_template, request
app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def form():
    return render_template('main.html')


@app.route('/result', methods=['GET', 'POST'])
def result():
    data = request.form['psas_input'].upper()
    return render_template('response.html', result=data)


def create_app():
    return app


if __name__ == "__main__":
    app.run()
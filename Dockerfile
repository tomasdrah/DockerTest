# python simple app
# docker build python__simple_app .
# docker run -t -i --name simple_app  python__simple_app

FROM python:3.10

# Create venv:
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"


# Install dependencies:
COPY requirements.txt .
RUN pip install -r requirements.txt

# Create repository:
ARG PROJECT_FOLDER="MySimpleApp"
RUN mkdir $PROJECT_FOLDER

COPY . $PROJECT_FOLDER

# RUN cd $project_folder && touch somefile.txt
# RUN ls "/$project_folder"

CMD ["python","MySimpleApp/main.py"]
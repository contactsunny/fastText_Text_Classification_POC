# fastText_Text_Classification_POC
This is a simple shell script to demonstrate the use of Facebook's fastText library for text classification. This could be considered as a first step to Natural Language Processing (NLP).

# Installing fastText
Installing the fastText library is very simple, just clone the repository, and run the ```make``` command:

```shell
git clone https://github.com/facebookresearch/fastText.git
cd fastText
make
```
You can also just run the script in the repo to do this automatically.

# Getting the test data
The test data we're using will be the freely available Stake Exchange questions about cooking. The dataset is available at https://dl.fbaipublicfiles.com/fasttext/data/cooking.stackexchange.tar.gz. You can either download the data manually or use the following command to download and extract it automatically:

```shell
wget https://dl.fbaipublicfiles.com/fasttext/data/cooking.stackexchange.tar.gz && tar xvzf cooking.stackexchange.tar.gz
```
You can also just run the script in the repo to do this automatically.

# Running the example code
Clone this repository on your local machine, navigate to the directory and run the following command to do everything automatically:
```shell
chmod +x app.sh
./app.sh
```

Once you do this, you should start getting the output at each stage.

# The Tutorial
I have written a detailed tutorial for this as [a series of posts on Medium]([https://towardsdatascience.com/tagged/the-fasttext-series](https://towardsdatascience.com/tagged/the-fasttext-series)). You can go through that for more info on how this works.

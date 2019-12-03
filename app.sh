git clone https://github.com/facebookresearch/fastText.git
cd fastText
make

wget https://dl.fbaipublicfiles.com/fasttext/data/cooking.stackexchange.tar.gz && tar xvzf cooking.stackexchange.tar.gz

head cooking.stackexchange.txt

head -n 12324 cooking.stackexchange.txt > training_data.txt
tail -n 3080 cooking.stackexchange.txt > testing_data.txt

./fasttext supervised -input training_data.txt -output cooking_question_classification_model
./fasttext predict cooking_question_classification_model.bin -

./fasttext test cooking_question_classification_model.bin testing_data.txt

cat cooking.stackexchange.txt | sed -e "s/\([.\!?,'/()]\)/ \1 /g" | tr "[:upper:]" "[:lower:]" > cooking.preprocessed.txt
head -n 12324 cooking.preprocessed.txt > preprocessed_training_data.txt
tail -n 3080 cooking.preprocessed.txt > preprocessed_testing_data.txt

./fasttext supervised -input preprocessed_training_data.txt -output cooking_question_classification_model
./fasttext test cooking_question_classification_model.bin preprocessed_testing_data.txt

./fasttext supervised -input preprocessed_training_data.txt -output cooking_question_classification_model -epoch 25
./fasttext test cooking_question_classification_model.bin preprocessed_testing_data.txt

./fasttext supervised -input preprocessed_training_data.txt -output cooking_question_classification_model -lr 1.0
./fasttext test cooking_question_classification_model.bin preprocessed_testing_data.txt

./fasttext supervised -input preprocessed_training_data.txt -output cooking_question_classification_model -epoch 25 -lr 1.0
./fasttext test cooking_question_classification_model.bin preprocessed_testing_data.txt
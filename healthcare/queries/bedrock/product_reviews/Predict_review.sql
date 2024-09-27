"""
input from ratings datagen connector

"""

INSERT into review_classification
SELECT 
    rating_id, 
    message,
    response AS prediction
FROM product_reviews, 
LATERAL TABLE(
    ML_PREDICT(
        'Product_Classifier',
        (message)
    )
);

CREATE TABLE review_classification (
    rating_id INT, 
    message STRING, 
    prediction STRING
);


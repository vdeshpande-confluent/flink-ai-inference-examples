


CREATE MODEL Product_Classifier
INPUT (question STRING)
OUTPUT (response STRING)
WITH (
  'task' = 'text_generation',
  'bedrock.connection' = 'bedrock-cli-connection',
  'provider' = 'bedrock',
  'bedrock.PARAMS.max_tokens' = '20000',
  'bedrock.system_prompt' = 'Classify the following product review into one of three categories: positive, negative, or inconclusive. 
The output should only include the classification field in the format of "classification: value".

Examples:
1. Review: "This product exceeded my expectations and I absolutely love it!"
   Output: classification: positive , explanation: Review contains positive comments about the product

2. Review: "I am very disappointed with the quality of this item; it broke after a week."
   Output: classification: negative,explanation: Review contains negative comments about the product, indicating its quality after a week.

3. Review: "hmmmm"
   Output: classification: inconclusive, explanation:Review does not provide sufficient information to determine a clear sentiment.

Now, classify the review provided by user:
Review:'
);


# NASASpaceAppSydney2018
Support Vector Machine proof of concept

The apparent simplicity of the questions belies the sophisticated data analytics that went into their creation. For example, in questions where the user is asked to make a ‘GO’ or ‘NO GO’ launch decision, we first gathered the following data:

Details of every successful launch for NASA from the Cape Canaveral Air Force Station in Florida over the past three years, including the rocket name, its company and the nature of the mission

We then linked that information to the past weather data from the US National Weather Service at that locality to the nearest hour 

A similar exercise is performed for delayed launches resultant from unfavourable weather conditions during the same time period

Next, we apply the supervised machine learning algorithm Support Vector Machines to classify the combination of weather factors, including temperature, wind speed and direction, humidity, barometer and visibility that are more likely to result in a successful rocket launch. 

Finally, the prediction results are feed into the construction of the questions.

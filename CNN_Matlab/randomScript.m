input_image_path = "C:\Users\ASUS\Downloads\download.jpeg";
input_image = imread(input_image_path);
input_image_scaled = input_image/255;
resized_image = imresize(input_image_scaled, [100, 100]);
%imshow(input_image_path)
% filters_conv1 = rand(3, 3, 3, 32);
% filters_bias1 = rand(1, 32);
stride_conv=1;
max_pool_size=2;
stride_pooling=2;

% conv1_output= conv2D_layer(resized_image,filters_conv1,filters_bias1,stride_conv);
% relu1_output=relu_activation(conv1_output);
% maxPooling1_output=MaxPooling2D_layer(relu1_output,max_pool_size,stride_pooling);

% filters_conv2=rand (3,3,32,32);
% filters_bias2=rand(1,32);

% conv2_output=conv2D_layer2(maxPooling1_output,filters_conv2,filters_bias2,stride_conv);
% relu2_output = relu_activation(conv2_output);
% maxPooling2_output=MaxPooling2D_layer(relu2_output,max_pool_size,stride_pooling);


% flatten_output=Flatten_layer(maxPooling2_output);
% weights_dense1= rand(64,16928);
% bias_dense1 = rand(64,1);
% dense1_output=Dense_layer(flatten_output,weights_dense1,bias_dense1,64);

% relu3_output=relu_activation(dense1_output);

% weights_dense2=rand(1,64);
% bias_dense2= rand(1,1);
% dense2_output=Dense_layer(relu3_output,weights_dense2,bias_dense2,1);

% final_activation_output=sigmoid_activation(dense2_output);
A=rand(100,100,3);
B=A/255;
output= forward_pass(resized_image,filters_conv1,filters_bias1,filters_conv2,filters_bias2,stride_conv, ...
    max_pool_size,stride_pooling,weights_dense1,bias_dense1,weights_dense2,bias_dense2);




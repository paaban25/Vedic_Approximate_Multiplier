function output = forward_pass(input_image,filters_conv1,filters_bias1,filters_conv2,filters_bias2,stride_conv,max_pool_size,stride_pooling,weights_dense1,bias_dense1,weights_dense2,bias_dense2)
    
    %First Convolution Layer
    conv1_output=conv2D_layer(input_image,filters_conv1,filters_bias1,stride_conv);
    relu1_output=relu_activation(conv1_output);
    maxPooling1_output=MaxPooling2D_layer(relu1_output,max_pool_size,stride_pooling);

    %Second Convolution Layer
    conv2_output=conv2D_layer2(maxPooling1_output,filters_conv2,filters_bias2,stride_conv);
    relu2_output = relu_activation(conv2_output);
    maxPooling2_output=MaxPooling2D_layer(relu2_output,max_pool_size,stride_pooling);

    % Flatten Layer
    flatten_output=Flatten_layer(maxPooling2_output);

    %First Dense Layer 
    dense1_output=Dense_layer(flatten_output,weights_dense1,bias_dense1,64);
    relu3_output=relu_activation(dense1_output);

    %Second Dense Layer 
    dense2_output=Dense_layer(relu3_output,weights_dense2,bias_dense2,1);
    final_activation_output=sigmoid_activation(dense2_output);
    output = final_activation_output;
    if(final_activation_output>0.5)
        disp("It is a CAT!!");
    else 
        disp("It is a DOG!!");
    end
    

end
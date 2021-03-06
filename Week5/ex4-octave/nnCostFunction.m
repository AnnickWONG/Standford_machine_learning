function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
% 
% Add bias unit to the X data matrix
a1 = [ones(m, 1) X];

% Hidden layer, add bias unit after sigmoid activation function
z2 = a1 * Theta1';
a2 = [ones(m, 1) sigmoid(z2)];

% Output layer
z3 = a2 * Theta2';
a3 = sigmoid(z3);

% Cost function without regularization
y_k = (1:num_labels == y);
J = J + 1/m * sum(sum((-y_k .* log(a3)) - ((1-y_k) .* log(1-a3))));
% % Calculate the cost function of each output units
% for i = 1:num_labels
%     y_k = (y == i);
%     J = J + 1/m * sum((-y_k .* log(a3(:,i))) - ((1-y_k) .* log(1-a3(:,i))));
% end

% Cost function with regularization
% Note that we don't need to calculate the theta for the bias units
temp1 = Theta1(:,2:input_layer_size+1).^2;
temp2 =  Theta2(:,2:hidden_layer_size+1).^2;
J = J + lambda/(2*m) * (sum(temp1(:)) + sum(temp2(:)));


% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%

delta3 = (a3 - y_k)';
delta2 = Theta2' * delta3 .* [ones(m,1) sigmoidGradient(z2)]';

Theta1_grad = Theta1_grad + 1/m * (delta2(2:end,:)) * a1;
Theta2_grad = Theta2_grad + 1/m * delta3 * a2;

% % Easier way to understand: calculate the gradient for one example at a time 
% Del1 = zeros(size(Theta1));
% Del2 = zeros(size(Theta2));
% y_matrix = (1:num_labels == y);
% 
% for i = 1:m
%     d3 = (a3(i,:) - y_matrix(i,:))';
%     d2 = Theta2' * d3 .* [1 sigmoidGradient(z2(1,:))]';
%     Del2 = Del2 + d3*a2(1,:);
%     Del1 = Del1 + d2(2:end)*a1(1,:);
% end
% 
% Theta2_grad = Theta2_grad + 1/m * Del2;
% Theta1_grad = Theta1_grad + 1/m *  Del1;

% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

% Note that the first column of Theta is used for the bias units,
% which should not be regularized.
Theta1_grad(:,2:end) = Theta1_grad(:,2:end) + lambda/m * Theta1(:,2:end);
Theta2_grad(:,2:end) = Theta2_grad(:,2:end) + lambda/m * Theta2(:,2:end);

% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end

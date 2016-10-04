function [ H ] = BA_model( size , m ,  m0 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
H = zeros(size, size);
connection_node = zeros(  1 ,size*m*2);
% connection number keeps tab of which connection belongs to which node.  


%initial connection of m0 nodes


connection_number = 0;

for i = 1 : m0-1 
    
    H(i,i+1) = 1;
    H(i+1,i) = 1;
    connection_number = connection_number+1;
    connection_node(connection_number) = i;
    connection_number = connection_number+1;
    connection_node(connection_number) = i+1;
    
end

% for each new connection, we increment connection number by 2 and store
% the nodes which are connected in the array connection_node.

%when a new node chooses a connection_number randomly, the number of node i
%in 1:connection_number is equal to number of connections that node has. so
%we choose a node with proability proportional to the number of connections
%it has.


number_of_connected_nodes = m0 ;

while(number_of_connected_nodes < size )
    %each new node has m outgoing connections.
    outgoing = 0 ; 
    iter = 0;
    while( outgoing < m )
        cumulative_node_num = random('Discrete Uniform', connection_number);
        node_num = connection_node(cumulative_node_num);
        if(H(number_of_connected_nodes + 1, node_num) == 0 && node_num ~= number_of_connected_nodes + 1)
            H(number_of_connected_nodes + 1, node_num) = 1;
            H(node_num , number_of_connected_nodes + 1) = 1;
            connection_number = connection_number + 1;
            connection_node(connection_number) = node_num;
            connection_number = connection_number + 1;
            connection_node(connection_number) = number_of_connected_nodes + 1;
    
            outgoing = outgoing + 1;
        end
    
    
    end
    
    number_of_connected_nodes = number_of_connected_nodes + 1 ;
end

    
    
    
    
    
    
    

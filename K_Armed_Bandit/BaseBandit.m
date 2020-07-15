classdef BaseBandit
    %BASEBANDIT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        k_arm = 10; 
        eps = .1; 
        Q = zeros(k_arm); 
        action_space = [1:1:k_arm];  
        
    end
    
    methods
        function  reset(inputArg1,inputArg2)
           
        end
        
        function action = act(obj,inputArg)
           action;
        end
        
        function r = reward()
            r;
        end 
        
        function update_Q()
           obj.Q = Q;
        end 
        
        function [action, reward] = step()
            
        end 
        
        
    end
end


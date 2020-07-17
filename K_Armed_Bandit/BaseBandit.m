classdef BaseBandit
    %BASEBANDIT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        k_arm
        eps  
        Q  
        action_space   
        
    end
    
    methods
        function obj = BaseBandit(num_arm, epsilon)
            obj.k_arm = num_arm;
            obj.eps = epsilon;  
            Q = zeros(obj.k_arm); 
            action_space = [1:1:obj.k_arm]; 
            
        end 
        
        function print_things(obj, string_print)
        
            disp(string_print)
        
        end
        
%         function  reset(inputArg1,inputArg2)
%            
%         end
%         
%         function action = act(obj,inputArg)
%            action;
%         end
%         
%         function r = reward()
%             r;
%         end 
%         
%         function update_Q()
%            obj.Q = Q;
%         end 
%         
%         function [action, reward] = step()
%             
%         end 
%         
        
    end
end


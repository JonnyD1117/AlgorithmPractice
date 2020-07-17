classdef BaseBandit < handle
    %BASEBANDIT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        k_arm
        eps  
        Q  
        action_space
        N
        num_steps
        num_episodes
        
        epis_true_reward_mean
        average_reward
       
        
    end
    
    methods
        function obj = BaseBandit(num_arm, epsilon, num_step, num_epis)
            
            obj.num_steps = num_step;
            obj.num_episodes = num_epis;             
            obj.k_arm = num_arm;
            obj.eps = epsilon;  
            obj.Q = zeros(1, obj.k_arm); 
            obj.action_space = 1:1:obj.k_arm; 
            obj.N = zeros(1,obj.k_arm);
            obj.epis_true_reward_mean = randn(1,5); 
            
            disp(obj.epis_true_reward_mean)
            
        end 
        
        function reset_episode(obj)
            
            obj.epis_true_reward_mean = randn(1,5); 
            
        end
       
        function action = select_action(obj)
            
            % With prob "epsilon" select random action to explore
            if rand <= obj.eps
                action = randi(obj.k_arm);
            % With prob (1-epsilon) select the maximal valued action    
            else
                [~, action] = max(obj.Q);           
            end     
            % Update Action Counter
            obj.N(action) = obj.N(action)+ 1;
        end
        
        function r = Reward(obj, action)
            
             r = obj.epis_true_reward_mean(action) + randn();   
     
        end 
        
        function update_Q(obj, action, reward)
            
            obj.Q(action) = obj.Q(action) + (1/obj.N(action))* (reward - obj.Q(action));
    
        end 
        
        function step(obj)
            
            action = obj.select_action();   % Select Action from Q-Table
            reward = obj.Reward(action);    % Get Reward from Bandit Prob.
            obj.update_Q(action, reward);   % Update Action-Value Func.   
            
        end 
        
        function episode(obj)
            
            % Iterate through single episode            
            for k = 1:1:obj.num_steps
                
                obj.step()
                
            end 
            
%             obj.reset_episode()

             
        end
        
        function training(obj)
            
            for k = 1:1:obj.num_episodes
               
                obj.episode
                
            end
            
            disp(obj.Q)
            disp(obj.N)
        end  
        
%         function plot_data(obj)
%             
%         end
    end
end


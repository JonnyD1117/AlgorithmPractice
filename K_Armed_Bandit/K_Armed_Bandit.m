
%% K- Armed Bandit Problem

k = 10; 
time_steps = 1000; 

reward_means = zeros(1, k);

reward = zeros(1,time_steps); 
time = zeros(1,time_steps);

Q = zeros(1, k);
N = zeros(1, k); 
eps = .1; 





for runs = 1:1:2000

        % Determine "K_th" Arm Reward Dist. Mean via Sampling Norm Dist. 
    for ind = 1:1:k

    rnd_samp = normrnd(0,1);    
    reward_means(ind) = rnd_samp;

    end 

    
    
    
    for n = 1:1:time_steps

        time(n) = n; 

        % Exploit Known High Reward    
        if rand <= (1-eps)
            [max_val, max_arg] = max(Q);        
            A = max_arg    ;   
        % Explore     
        elseif rand > eps
             A = randi([1, k]);
        end 

        R = bandit(A, reward_means);

        [Q(A), N] = Q_Update(Q(A),R,A,N);

        reward(n) = R;



    end 
end 

avg_reward = movmean(reward,3);

plot(time,avg_reward)

function [Q_new, N] = Q_Update(Q,R,A, N)

N(A) = N(A) + 1;
Q_new = (1/N(A))*(R - Q);

end 


function reward = bandit(A, reward_mean_dist)
r_mean = reward_mean_dist(A);
reward = normrnd(r_mean,1); 

end 



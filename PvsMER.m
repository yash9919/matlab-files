clc;
clear all;
%variables for I1
clear all;
clc;
target_snr_threshold=3;
secrecy_snr_threshold=1.32;
epsilom1=0.5;
N=2;
L=2;
beta1=1;
alpha=1;
eta=0.8;
SOR_iterator=1;
for M=1:3
    for lambda=0:5:30
        lambda_abs=10.^(lambda/10);
        P=lambda_abs;
        epsilom2=epsilom1/lambda_abs;
        beta2=beta1/lambda_abs;
        I1_total=0;
        I1_partial=1-(exp(1).^((-1)*target_snr_threshold/(lambda_abs*alpha)));
     %summation from m to M
    %=======================================================
    m_total=0;
        for m=0:M
            %loop for calculatinf Tau
            %========================
            tau=0;
            for l=1:L
                l_tau=nchoosek(L,l)*((-1).^(l-1))*(l*epsilom1/((l*epsilom1)+(m*secrecy_snr_threshold*epsilom2)));
                tau=tau+l_tau;
            end
            %========================
            m_iteration=nchoosek(M,m)*((-1).^m)*tau*(exp(1).^(((-1)*m*(secrecy_snr_threshold-1))/(P*epsilom1)));
            m_total=m_total+m_iteration;
        end
    %========================================================
        I1_total=I1_partial*m_total;
        I2_total=0;
        
        
        
   
for K=1:N
      I2_part1=exp(1).^(((-1)*K*secrecy_snr_threshold)/(lambda_abs*alpha));
      I2_part2=(1-exp(1).^(((-1)*target_snr_threshold)/(lambda_abs*alpha))).^(N-K);
      
      
    %loop for summation over q=================================================
    q_total=0;
        
    
    
        if K==1
            
            %loop for K=1===========================================================
            for q1=0:M
                for q2=0:M-q1
            binomial_co_total=nchoosek(M,q1)*nchoosek(M-q1,q2);
 
            %Calculation of b's==========================
            for b_iterator=0:K
                b_total=0;
                if b_iterator==0
                    for k=0:K
                        b_temp=nchoosek(K,k)*((((-1).^(k-1))*eta*beta1)/((eta*beta1)-(k*epsilom1)));
                        b_total=b_total+b_temp;
                    end
                    b(b_iterator+1)=b_total;
                else
                        b_total=nchoosek(K,k)*(((-1).^(k))*eta*beta1)/((eta*beta1)-(k*epsilom1));    
                    b(b_iterator+1)=b_total;        
                end
            end
            %==============================================
            d1q=binomial_co_total*((b(1).^q2)*(b(2).^(M-q1-q2)));
            d2q=(q2/epsilom1)+((K*(M-q1-q2))/(eta*beta1))+(M-q1-q2)/(eta*beta1)
            q_total=d1q*(exp(1).^(((-1)*d2q*(secrecy_snr_threshold-1))/lambda_abs));
                end
            end
    %loop end for K=1===========================================================
 
    %loop for K=2===========================================================
        else
            for q1=0:M
                for q2=0:M-q1
                    for q3=0:M-q1-q2
                        binomial_co_total=nchoosek(M,q1)*nchoosek(M-q1,q2)*nchoosek(M-q1-q2,q3);
    %Calculation of b's==========================
            for b_iterator=0:K
                b_total=0;
                if b_iterator==0
                    for k=0:K
                        b_temp=nchoosek(K,k)*((((-1).^(k-1))*eta*beta1)/((eta*beta1)-(k*epsilom1)));
                        b_total=b_total+b_temp;
                    end
                    b(b_iterator+1)=b_total;
                else
                        b_total=nchoosek(K,k)*((((-1).^(k))*eta*beta1)/((eta*beta1)-(k*epsilom1)));    
                    b(b_iterator+1)=b_total;        
                end
            end
    %==============================================
            d1q=binomial_co_total*((b(1).^q2)*(b(3).^(M-q1-q2-q3))*(b(2).^q3));
            d2q=(q2/epsilom1)+((K*(M-q1-q2-q3))/(eta*beta1))+((q3/(eta*beta1))+(2*(M-q1-q2-q3)/(eta*beta1)))
            q_total=q_total+(d1q*(exp(1).^(((-1)*d2q*(secrecy_snr_threshold-1))/lambda_abs)));
 
                end
                end
            end
        end
    %loop for K=2===========================================================
    %loop end for summation over q=================================================
        
        
        
    %loop for l summation=================
            sum_l=0;
            for l1=0:L
                for l2=0:L-l1
                    cl=(-1)*nchoosek(L,l1)*nchoosek(L,l2)*(((epsilom2/(eta*beta2-epsilom2))).^l1)*((eta*beta2)/(epsilom2-(eta*beta2))).^l2;
                    sum_l=sum_l+(cl*((l1/epsilom2)+(l2/(eta*beta2)))/(1*secrecy_snr_threshold+(l1/epsilom2)+(l2/eta*beta2)));
                end
            end
    %loop end for l summation=================
         
        
        I2_part3=nchoosek(N,K)*sum_l*q_total;
        I2_total=I2_total*I2_part3*I2_part1*I2_part2;
        end
    secrecy_outage_probability(SOR_iterator)=I1_total+I2_total;
    SOR_iterator=SOR_iterator+1;
     end
end


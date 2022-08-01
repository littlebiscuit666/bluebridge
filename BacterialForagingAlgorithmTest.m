% Bacterial Foraging Algorithm
clear all;
clc;
% parameters initializing
ExtraSpeed=0.1;
Bounds=[-5.12,5.12;-5.12,5.12];%boundaries of variable
Dimension=2;% the number of every bacteria features
Number=26;% bacteria number
Iteration=100; %the iteration
MaxMoving=4;%the maximum length of moving in  one direction
C(:,1)=0.001*ones(Number,1);%after reverse direction, the length of moving forward
NumberReplication=6;
NumberMigration=3;
NumberDivision=Number/2;
ProbabilityMigration=0.25+ExtraSpeed+ExtraSpeed;
DoseAttract=0.05+ExtraSpeed;
SpeedToReleaseDoseAttract=0.05+ExtraSpeed;
DoseRepellant=0.05+ExtraSpeed;
SpeedToReleaseDoseRepellant=0.05+ExtraSpeed;
% initializing bacteria position
for i=1:Number
    P(1,i,1,1,1) = -5.12 + rand*10.24;
    P(2,i,1,1,1) = -5.12 + rand*10.24; 
end
% now for iteration
for l=1:NumberMigration
    for k=1:NumberReplication
        for j=1:Iteration
            for i=1:Number
                %J means fitness
                J(i,j,k,l) = Cost(P(:,i,j,k,l)); 
                %Jcc is a akin of pheromone
                Jcc=sum(-DoseAttract*exp(-SpeedToReleaseDoseAttract*((P(1,i,j,k,l)-...
                    P(1,1:Number,j,k,l)).^2+(P(2,i,j,k,l)-P(2,1:Number,j,k,l)).^2))) +...
                    sum(DoseRepellant*exp(-SpeedToReleaseDoseRepellant*((P(1,i,j,k,l)-... 
                    P(1,1:Number,j,k,l)).^2+(P(2,i,j,k,l)-P(2,1:Number,j,k,l)).^2))); 
                J(i,j,k,l) = J(i,j,k,l) + Jcc;  
                Jlast = J(i,j,k,l);
                %Delta mean reverse
                Delta(:,i) = (2*round(rand(Dimension,1))-1).*rand(Dimension,1); 
                %PHI mean after reversing, choose a random direction move forward
                PHI = Delta(:,i)/sqrt(Delta(:,i)'*Delta(:,i));  
                P(:,i,j+1,k,l) = P(:,i,j,k,l) + C(i,k)*PHI;
                J(i,j+1,k,l) = Cost(P(:,i,j+1,k,l)); 
                %m means roamming
                m = 0; 
                while(m < MaxMoving) 
                    m=m+1;
                    if(J(i,j+1,k,l) <Jlast)
                        Jlast = J(i,j+1,k,l); 
                        P(:,i,j+1,k,l) = P(:,i,j+1,k,l) + C(i,k)*PHI;
                        J(i,j+1,k,l) = Cost(P(:,i,j+1,k,l)); 
                    else 
                            m = MaxMoving;
                    end
                end
                J(i,j,k,l) = Jlast; 
            end
            
x = P(1,:,j,k,l); 
y = P(2,:,j,k,l); 
clf% CLear Figure
plot(x,y,'h') % h is parameter meaning hexagram 
axis([-5 5 -5 5]); % setting axis 
pause(.01) % pause 0.1 second then resume

        end
        % every bacteria has its own health scale
        Jhealth = sum(J(:,:,k,l),2); 
        [Jhealth,sortind] = sort(Jhealth);% sort is a function to rearrage members in ascending order
        P(:,:,1,k+1,l) = P(:,sortind,Iteration+1,k,l);
        C(:,k+1) = C(sortind,k);  
        for i=1:NumberDivision
            P(:,i+NumberDivision,1,k+1,l) = P(:,i,1,k+1,l); 
            C(i+NumberDivision,k+1) = C(i,k+1);           
        end
    end
    for m=1:Number
        if(ProbabilityMigration> rand)
            P(1,m,1,1,1) = -5.12 + rand*10.24; 
            P(2,m,1,1,1) = -5.12 + rand*10.24; 
        else
            P(:,m,1,1,l+1) = P(:,m,1,NumberReplication+1,l); 
        end       
    end
end
for i=1:Number
    %the best particle in each iteration
    BestIteration(i)=min(J(i,:,NumberReplication,NumberMigration)) ;
end
[LowestFitness,BestbacteriaLabel]=min(BestIteration);
reproduction = J(:,1:Iteration,NumberReplication,NumberMigration) ;
%search for the lowest fitness
figure
plot(1:(Iteration+1),J(BestbacteriaLabel,:,NumberReplication,NumberMigration))
title('the track of the best particle ')
[Jlastreproduction,O] = min(reproduction,[],2);
[BestY,I] = min(Jlastreproduction);
Pbest = P(:,I,O(I,:),k,l)
BestY


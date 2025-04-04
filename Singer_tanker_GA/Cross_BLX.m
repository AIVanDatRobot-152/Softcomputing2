function child=Cross_BLX(parent,cross_prob,alpha,elitism,bestchrom)

% BLX-alpha crossover
% Programmed by: Huynh Thai Hoang
% Last updated : March 9, 2006

if (nargin < 4),
   error(['Too few input arguments.']);
end;

[pop_size,chrom_len]=size(parent);
for p1 = 1:pop_size,						% parent number 1 
	if (elitism==1) & (p1 == bestchrom)  	% If elitism on, and have the elite member
        child(p1,:)=parent(p1,:);
    else
        p2=p1;  							% Randomly chose the parent number 2
        while p2 == p1,   					% other than parent number 1
        	p2 = rand*pop_size; 											 								
        	p2 = p2 - rem(p2,1)+1;     
        end
        
    	if cross_prob > rand           		% If true then crossover occur
            for gene=1:chrom_len,
                L=min(parent(p1,gene),parent(p2,gene))-alpha*abs(parent(p1,gene)-parent(p2,gene));
                H=max(parent(p1,gene),parent(p2,gene))+alpha*abs(parent(p1,gene)-parent(p2,gene));
                child(p1,gene)=L+rand*(H-L);
            end
     	else                           		% No crossover occurs
			child(p1,:)=parent(p1,:);
 		end
  	end  	% End the "if ELITISM..." statement
end  		% End "for p1=..." loop
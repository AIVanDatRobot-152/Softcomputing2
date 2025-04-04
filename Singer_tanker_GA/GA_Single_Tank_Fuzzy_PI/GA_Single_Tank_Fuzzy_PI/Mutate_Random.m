function mchrom=Mutate_Random(chrom,mutat_prob,range,elitism,bestchrom)

% MUTATION Mutation
%
% Input: 	chrom_	: parent chromosomes
%  		    mutat_prob_	: crossover probability
%			elitism_	: 
%			bestchrom_	:
% Output:   mchrom_ 	: 
%
% See also:

% Programmed by   : Huynh Thai Hoang, University of Technology at Ho Chi Minh City. 
% Last updated    : March 9, 2006

if (nargin < 4),
   error(['Too few input arguments.']);
end;

[pop_size,chrom_len]=size(chrom);
mchrom = chrom;
for p = 1:pop_size,
   if elitism==0 | p ~=bestchrom,  	
         if mutat_prob > rand				% If true then mutate  
            for gene = 1:chrom_len,
 		        mchrom(p,gene)=(rand-0.5)*(range(2,gene)-range(1,gene))+... 
		                         0.5*(range(2,gene)+range(1,gene));
	        end
        end  
   end  
end  
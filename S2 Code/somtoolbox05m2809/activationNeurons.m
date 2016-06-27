function AN = activationNeurons(sMap, sData)
%this function is modified som_bmus
%calculation of activation of neurons is based on dot product instead of norms of difference
%input vector and synaptic weight vector
%find word change


%SOM_BMUS Find the best-matching units from the map for the given vectors.
%
% [Bmus, Qerrors] = som_bmus(sMap, sData, [which], [mask])
% 
%   bmus = som_bmus(sM,sD);
%   [bmus,qerrs] = som_bmus(sM,D,[1 2 3]);
%   bmus = som_bmus(sM,D,1,[1 1 0 0 1]);
%
%  Input and output arguments ([]'s are optional): 
%   sMap     (struct) map struct
%            (matrix) codebook matrix, size munits x dim
%   sData    (struct) data struct
%            (matrix) data matrix, size dlen x dim
%   [which]  (vector) which BMUs are returned, [1] by default 
%            (string) 'all', 'best' or 'worst' meaning [1:munits],
%                     [1] and [munits] respectively  
%   [mask]   (vector) mask vector, length=dim, sMap.mask by default
%
%   Bmus     (matrix) the requested BMUs for each data vector, 
%                     size dlen x length(which)
%   Qerrors  (matrix) the corresponding quantization errors, size as Bmus
%
% NOTE: for a vector with all components NaN's, bmu=NaN and qerror=NaN
% NOTE: the mask also effects the quantization errors
%
% For more help, try 'type som_bmus' or check out online documentation.
% See also  SOM_QUALITY.

%%%%%%%%%%%%% DETAILED DESCRIPTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% som_bmus
%
% PURPOSE
%
% Finds Best-Matching Units (BMUs) for given data vector from a given map.
%
% SYNTAX
%
%  Bmus = som_bmus(sMap, sData)
%  Bmus = som_bmus(..., which)
%  Bmus = som_bmus(..., which, mask)
%  [Bmus, Qerrs] = som_bmus(...)
%
% DESCRIPTION
%
% Returns the indexes and corresponding quantization errors of the
% vectors in sMap that best matched the vectors in sData.
%
% By default only the index of the best matching unit (/vector) is
% returned, but the 'which' argument can be used to get others as
% well. For example it might be desirable to get also second- and
% third-best matching units as well (which = [1:3]). 
%
% A mask can be used to weight the search process. The mask is used to
% weight the influence of components in the distance calculation, as
% follows: 
%
%   distance(x,y) = (x-y)' diag(mask) (x-y)
%
% where x and y are two vectors, and diag(mask) is a diagonal matrix with 
% the elements of mask vector on the diagonal. 
%
% The vectors in the data set (sData) can contain unknown components
% (NaNs), but the map (sMap) cannot. If there are completely empty
% vectors (all NaNs), the returned BMUs and quantization errors for those 
% vectors are NaNs.
%
% REQUIRED INPUT ARGUMENTS
%
%   sMap              The vectors from among which the BMUs are searched
%                     for. These must not have any unknown components (NaNs).
%            (struct) map struct
%            (matrix) codebook matrix, size munits x dim
%                     
%   sData             The data vector(s) for which the BMUs are searched.
%            (struct) data struct
%            (matrix) data matrix, size dlen x dim
%
% OPTIONAL INPUT ARGUMENTS 
%
%   which    (vector) which BMUs are returned, 
%                     by default only the best (ie. which = [1])
%            (string) 'all', 'best' or 'worst' meaning [1:munits],
%                     [1] and [munits] respectively  
%   mask     (vector) mask vector to be used in BMU search, 
%                     by default sMap.mask, or ones(dim,1) in case
%                     a matrix was given
%
% OUTPUT ARGUMENTS
% 
%   Bmus     (matrix) the requested BMUs for each data vector, 
%                     size dlen x length(which)
%   Qerrors  (matrix) the corresponding quantization errors, 
%                     size equal to that of Bmus
%
% EXAMPLES
%
% Simplest case:
%  bmu = som_bmus(sM, [0.3 -0.4 1.0]);
%           % 3-dimensional data, returns BMU for vector [0.3 -0.4 1]
%  bmu = som_bmus(sM, [0.3 -0.4 1.0], [3 5]);
%           % as above, except returns the 3rd and 5th BMUs
%  bmu = som_bmus(sM, [0.3 -0.4 1.0], [], [1 0 1]);
%           % as above, except ignores second component in searching
%  [bmus qerrs] = som_bmus(sM, D);
%           % returns BMUs and corresponding quantization errors 
%           % for each vector in D
%  bmus = som_bmus(sM, sD);
%           % returns BMUs for each vector in sD using the mask in sM
%
% SEE ALSO
% 
%  som_quality      Measure the quantization and topographic error of a SOM.

% Copyright (c) 1997-2000 by the SOM toolbox programming team.
% http://www.cis.hut.fi/projects/somtoolbox/

% Version 1.0beta juuso 071197, 101297 
% Version 2.0alpha juuso 201198 080200

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% check arguments and initialize

error(nargchk(1, 4, nargin));  % check no. of input args is correct

% sMap
if isstruct(sMap), 
  switch sMap.type, 
   case 'som_map', M = sMap.codebook; 
   case 'som_data', M = sMap.data;
   otherwise, error('Invalid 1st argument.');
  end
else 
  M = sMap; 
end
[munits dim] = size(M);
if any(any(isnan(M))), 
  error ('Map codebook must not have missing components.');
end

% data
if isstruct(sData), 
  switch sData.type, 
   case 'som_map', D = sData.codebook;
   case 'som_data', D = sData.data;
   otherwise, error('Invalid 2nd argument.');
  end
else 
  D = sData;
end
[dlen ddim] = size(D);
if dim ~= ddim, 
  error('Data and map dimensions do not match.')
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% action

%change
pom=M*D';
[DotPrPom,BmusPom]=sort(pom,'descend');
AN=pom';


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

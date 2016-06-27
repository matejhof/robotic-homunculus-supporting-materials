Synthetic training data generation. 
A function $\texttt{createTouches2}$  implements the mentioned way of creating training set with uniform distribution of numbers of taxels stimulations. Function is called $\texttt{C=createTouches2(ySize,xSize,number\_of\_touches,touchProbability)}$.
The input parameters $\texttt{ySize,xSize}$ determine size of the rectangular skin, the parameter $\texttt{number\_of\_touches}$ determines number of touches in a training set and the parameter $\texttt{touchProbability}$ is in this paper always equal to one (a smaller value allow to decrease number of stimulated taxels in a single touch). The Rows of the output matrix $C$ (size $(number\_of\_touches,xSize*ySize)$) contains vectors with touches.

Multitouches

If we want more stimulations ($k>1$) in a moment it is possible create with $\texttt{createTouches2}$ independently matrices $C_1,C_2,...,C_k$ and then make their superposition $C=C_1+C_2+..+C_k$. After that it is necessary avoid values greater than one by rule $\texttt{if C(i,j)>1 then C(i,j)=1 for all i,j}$. A vector of the training set $C$ we will call by $k$-touch ($k$ simultaneous stimulations of the skin).


Topology Preservation Measure with External Distance Metric (TPMEDM)
in function measure2.m
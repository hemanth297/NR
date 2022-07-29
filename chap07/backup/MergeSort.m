function [D,index]=NR_MergeSort(D,v,a,b)
% function [D,index]=NR_MergeSort(D,v,a,b)
% Reorder a matrix D based on the elements in its first column using a merge sort.
% See <a href="matlab:NRweb">Numerical Renaissance: simulation, optimization, & control</a>, Section 7.1.4.
% Part of <a href="matlab:help NRC">Numerical Renaissance Codebase 1.0</a>, <a href="matlab:help NRchap07">Chapter 7</a>; please read the <a href="matlab:help NRcopyleft">copyleft</a>.
% See also NR_InsertionSort, NR_BlockInsertionSort, NR_QuickSort, NR_HeapSort, NR_CocktailSort,
% NR_BitonicSort, NR_OddEvenNR_MergeSort.  Verify with NR_MergeSortTest.

if nargout==2, D=[D, [1:size(D,1)]']; end, if nargin==3, b=a; a=1; end
if b-a > 0
  b1 = a + floor((b-a)/2); a1=b1+1; D=NR_MergeSort(D,v,a,b1); D=NR_MergeSort(D,v,a1,b);
  while b1-a >= 0 & b-a1 >= 0
    if D(a1,1) < D(a,1); D(a:a1,:)=[D(a1,:); D(a:a1-1,:)];
      if v, plot(D(:,1),'x'), pause(0.1), end
      a1=a1+1; b1=b1+1; end; a=a+1;
end; end
if nargout==2, index=round(D(:,end)); D=D(:,1:end-1); end
end % function NR_MergeSort

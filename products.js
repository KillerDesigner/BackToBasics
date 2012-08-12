/*
*   PUZZLE
*
*   Given an array of numbers, nums, return an array of numbers products, 
*	where products[i] is the product of all nums[j], j != i
*
*   Solution must be O(n) and cannot use division
*/


function products(arr) {
	var out = [];
	var pre = [];
	var post = [];

	var prod = 1;
	var prod2 = 1;
	var len = arr.length;
	for(var i = 0; i< arr.length; i++) {
		pre[i] = prod;
		prod *= arr[i];
		
		post[len-i-1] = prod2;
		prod2 *= arr[len-i-1];
	}
	
	for(var i = 0; i < arr.length; i++) {
		out[i] = post[i] * pre[i];
	}
	
	return out;
	
}

console.log(products([1, 2, 3, 4]));
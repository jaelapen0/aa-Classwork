// function curriedSum(numArgs){
//    let arr = [];
//    debugger;
// //    let limit = (Array.from(numArgs[0]))[0];
   
//          return function curriedAdd (arg){    
//             arr.push(arg);
//             console.log(arr.reduce(function(acc, el){
//                 return acc + el;
//             }));
//             debugger
//             return curriedAdd;
//             }
            
    
// }



function curriedSum(numArgs) {
    const numbers = [];
   
       
    function _curriedSum(num) {
       
        numbers.push(num);

        if (numbers.length === numArgs) {
            let total = 0;

            numbers.forEach(function(n)
                 { return total += n; });

            return total;
            
        } else {
             return _curriedSum;
        }
    }
    
    return _curriedSum;
}

const sum = curriedSum(4); 
// function_curriedSum(num) 
console.log(sum(2)(1)(11)(5)); //function_curriedSum(2)
// let sum = curriedSum(2);
// // consol

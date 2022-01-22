function swap(arr, index1, index2) {
    let temp = arr[index1];
    arr[index1] = arr[index2];
    arr[index2] = temp;
}

function selectionSort(arr) {
    for (let i=0; i<arr.length; i++){
        let smaller = i;

        for (let j=i+1; j<arr.length; j++){
            if (arr[smaller] > arr[j]){
                smaller = j 
            }
        }

        swap(arr, i, smaller)
    }
}

module.exports = {
    selectionSort,
    swap
};
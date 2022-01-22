function insertionSort(arr) {
    for (let i = 1; i<arr.length; i++){
        let current = arr[i];
        let j = i-1

        while (j>=0 && current < arr[j]){
            arr[j+1] = arr[j]
            j -= 1 
        }
        arr[j+1] = current
    }
    return arr
}

module.exports = {
    insertionSort
};
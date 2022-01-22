function swap(array, idx1, idx2) {
    let c1 = array[idx1]
    let c2 = array[idx2]
    array[idx1] = c2
    array[idx2] = c1
    return array;
}

function bubbleSort(array) {
    let sorted = false

    while (!sorted){
        sorted = true

        for (let i = 0; i<array.length-1; i++){
            if (array[i] > array[i+1]){
                swap(array, i, i+1)
                sorted=false
            }
        }
    }

    return array;
}


module.exports = {
    bubbleSort,
    swap
};
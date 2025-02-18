#include <iostream>
#include <vector>
#include <stack>
#include <sstream>  // For processing user input line

using namespace std;

// Function to partition the array
int partition(vector<int>& arr, int low, int high) {
    int pivot = arr[high]; 
    int i = (low - 1); 

    for (int j = low; j <= high - 1; j++) {
        if (arr[j] < pivot) {
            i++;
            swap(arr[i], arr[j]);
        }
    }
    swap(arr[i + 1], arr[high]);
    return (i + 1);
}

// Iterative QuickSort function
void quickSortIterative(vector<int>& arr, int l, int h) {
    stack<pair<int, int>> s;
    s.push({l, h});

    while (!s.empty()) {
        auto [low, high] = s.top();
        s.pop();

        if (low < high) {
            int p = partition(arr, low, high);
            if (p - 1 > low) s.push({low, p - 1});
            if (p + 1 < high) s.push({p + 1, high});
        }
    }
}

// Function to print an array
void printArray(const vector<int>& arr) {
    for (int num : arr) {
        cout << num << " ";
    }
    cout << endl;
}

// Main function to keep asking for input until user exits
int main() {
    string input;

    cout << "📌 Enter a list of space-separated numbers to sort (or type 'exit' to quit):\n";
    
    while (true) {
        cout << "\n🔹 Enter numbers: ";
        getline(cin, input);  // Read the full line of input

        // Check if the user wants to exit
        if (input == "exit") {
            cout << "👋 Exiting the program. Goodbye!\n";
            break;
        }

        vector<int> arr;
        stringstream ss(input);
        int num;

        // Convert input into a vector of integers
        while (ss >> num) {
            arr.push_back(num);
        }

        if (arr.empty()) {
            cout << "⚠️ Please enter valid numbers!\n";
            continue;
        }

        // Display the original array
        cout << "🔹 Original array: ";
        printArray(arr);

        // Sort the array using iterative QuickSort
        quickSortIterative(arr, 0, arr.size() - 1);

        // Display the sorted array
        cout << "✅ Sorted array: ";
        printArray(arr);
    }

    return 0;
}

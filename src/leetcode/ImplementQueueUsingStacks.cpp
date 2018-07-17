class MyQueue {
public:
    
    vector<int> vQueue;
    
    /** Initialize your data structure here. */
    MyQueue() {
        vQueue = vector<int>();
    }
    
    /** Push element x to the back of queue. */
    void push(int x) {
        vQueue.push_back(x);
    }
    
    /** Removes the element from in front of queue and returns that element. */
    int pop() {
        int num = vQueue[0];
        vQueue.erase(vQueue.begin());
        return num;
    }
    
    /** Get the front element. */
    int peek() {
        return vQueue[0];
    }
    
    /** Returns whether the queue is empty. */
    bool empty() {
        if(vQueue.size() == 0){
            return true;
        }
        return false;
    }
};

/**
 * Your MyQueue object will be instantiated and called as such:
 * MyQueue obj = new MyQueue();
 * obj.push(x);
 * int param_2 = obj.pop();
 * int param_3 = obj.peek();
 * bool param_4 = obj.empty();
 */
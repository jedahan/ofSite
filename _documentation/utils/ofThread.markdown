#class ofThread


##InlineDescription




a thread base class with a built in mutex

derive this class and implement threadedFunction() 





##Description

ofThread is a thread base class with a built in mutex. A [thread](http://en.wikipedia.org/wiki/Thread_(computing)) is essentially a mini processing object you can run in parallel to your main application loop and is useful for running time intensive operations without slowing down your app.

####Implementing a Thread

For instance, you have to grab from a camera and waiting for an image slows down your app. You can offload this wait to a thread which tells the main app when an image is ready. To do this, you create a class that inherits from the ofThread class and implement the threadedFunction() function.

Declaration in a .h file:

~~~~{.cpp}

class MyThread : public ofThread {

	...

	// the thread function
	void MyThread::threadedFunction() {
	
		// start
	
		while(isThreadRunning()) {
	
			cam.update();
			if(cam.isFrameNew()) {
		
				// load the image
				image.setFromPixels(cam.getPixelsRef());
			}
		}
	
		// done
	}
	
	ofVideoGrabber cam;	// the cam
	ofImage image;
};

~~~~

In the .cpp file:

~~~~{.cpp}

void ofApp::setup() {
	
	// create object
	MyThread thread;
	
	// start the thread
	thread.startThread(true, false);	// blocking, non verbose
}

void ofApp::update() {
	
	// do something with the thread is running
}

void ofApp::exit() {

	// stop the thread
	thread.stopThread();
}

~~~~

####Shared Resources

With this great power, however, comes great responsibility. If both the thread and your main app loop try to access the image at the same time, bad things happen inside your computer and the app will crash. The image is a considered a "shared resource" and you need to make sure to lock access to it so that only 1 thread can access it a time. You can do this using a ["mutal exclusion" object](http://en.wikipedia.org/wiki/Mutex) by called lock() when you want to access the resource, then unlock() when you are done.

Declaration in a .h file:

~~~~{.cpp}

class MyThread : public ofThread {

	...

	// the thread function
	void MyThread::threadedFunction() {
	
		// start
	
		while(isThreadRunning()) {
	
			cam.update();
			if(cam.isFrameNew()) {
	
				// lock access to the resource
				lock();
				
				// load the image
				image.setFromPixels(cam.getPixelsRef());	
				// done with the resource
				unlock();
			}	
		}
	
		// done
	}

	ofVideoGrabber cam;	// the cam
	ofImage image;		// the shared resource
};

~~~~

In the .cpp file:

~~~~{.cpp}

void ofApp::setup() {
	
	// create object
	MyThread thread;
	
	// start the thread
	thread.startThread(true, false);	// blocking, non verbose
}

void ofApp::update() {
	
	// lock access to the resource
	thread.lock();
	
	// copy image
	myImage = thread.image;
	
	// done with the resource
	thread.unlock();
}

void ofApp::exit() {

	// stop the thread
	thread.stopThread();
}

~~~~

####Exiting Nicely

As a thread is running in parallel with your application main loop, it's important to remember to tell it to stop before exiting the app. If you don't, you'll get weird errors or hangs because you aren't being nice to your threads. Depending on how you started your thread (blocking or non-blocking mode), you will either stop it for wait for it to finish. See the stopThread() & waitForThread() functions.

####Debugging

Thread errors are *notoriously* difficult to debug sometimes. You will probably see a "Bad Access" runtime error or something similar if multiple threads are trying to access a shared resource simultaneously. Other times, nothing will happen as the thread may be stuck in an infinite loop and you can't stop it. Wee! We assume if you've read this far, you probably accept the difficulties in order to reap the thread speed rewards. 

A useful tool in debugging thread timing and access is the ofThread verbose mode which prints thread events such as starting, stopping, and mutex locking/unlocking. Simply set verbose=true when calling startThread(). Another trick is to use an ofSleepMillis() inside the thread to slow it down so you can see the timing better while debugging it.

####HOO RAH

Ok soldier, lock and load ... good luck!





##Methods



###ofThread * getCurrentThread()

<!--
_syntax: getCurrentThread()_
_name: getCurrentThread_
_returns: ofThread *_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: yes_
_visible: True_
_advanced: False_
-->

_inlined_description: _



get the current thread, returns NULL if in the main app thread

this is useful if you want to access the currently active thread:

ofThread* myThread = ofThread::getCurrentThread(); if(myThread != NULL){ ofLog() << "Current thread is " << myThread->getThreadName(); } else{ ofLog() << "Current thread is the main app thread"; } 







_description: _








<!----------------------------------------------------------------------------->

###Poco::Thread & getPocoThread()

<!--
_syntax: getPocoThread()_
_name: getPocoThread_
_returns: Poco::Thread &_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0072_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_inlined_description: _









_description: _








<!----------------------------------------------------------------------------->

###int getThreadId()

<!--
_syntax: getThreadId()_
_name: getThreadId_
_returns: int_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_inlined_description: _



get the unique thread id

note: this is not the OS thread id! 







_description: _








<!----------------------------------------------------------------------------->

###string getThreadName()

<!--
_syntax: getThreadName()_
_name: getThreadName_
_returns: string_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_inlined_description: _

get the unique thread name, in the form of "Thread id#" 









_description: _








<!----------------------------------------------------------------------------->

###bool isCurrentThread()

<!--
_syntax: isCurrentThread()_
_name: isCurrentThread_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_inlined_description: _

returns true if this the currently active thread 



in multithreaded situations, it can be useful to know which thread is currently running some code in order to make sure only certain threads can do certain things ...

this is especially useful with graphics as resources must be allocated and updated inside the main app thread only:

if(myThread.isCurrentThread()){ // do some myThread things, keep your hands off my resources! } else if(ofThread::isMainThread()){ // pheew! ok, update those graphics resources } 







_description: _








<!----------------------------------------------------------------------------->

###bool isMainThread()

<!--
_syntax: isMainThread()_
_name: isMainThread_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: yes_
_visible: True_
_advanced: False_
-->

_inlined_description: _

returns true if the main app thread is the currently active thread 









_description: _








<!----------------------------------------------------------------------------->

###bool isThreadRunning()

<!--
_syntax: isThreadRunning()_
_name: isThreadRunning_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_inlined_description: _

returns true if the thread is currently running 









_description: _


Returns true if the thread is currently running. This is especially useful inside the thread's threadedFunction() when you want it to loop continuously until it's told to exit:

~~~~{.cpp}

class MyThread : public ofThread {

	...

	// the thread function
	void MyThread::threadedFunction() {
	
		// start
	
		while(isThreadRunning()) {
	
			// do stuff
		}
	
		// done
	}

};

~~~~







<!----------------------------------------------------------------------------->

###bool lock()

<!--
_syntax: lock()_
_name: lock_
_returns: bool_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_inlined_description: _



try to lock the mutex

if the thread is blocking, this call will wait until the mutex is available

if the thread is non-blocking, this call will return a true or false if the mutex is available 







_description: _


Try to lock the mutex.

If the thread was started in blocking mode in startThread(), any thread (including your app main loop) will wait until the mutex is unlocked.

If the thread is non-blocking, this call will immediately return a true or false if the mutex is available. It is up to you to make sure the resource is not being used when accessing it. See the [Wikipedia article on Non-blocking](http://en.wikipedia.org/wiki/Non-blocking_algorithm) for reasons as to why using a non-blocking thread might be more advantageous.







<!----------------------------------------------------------------------------->

### ofThread()

<!--
_syntax: ofThread()_
_name: ofThread_
_returns: _
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: False_
_advanced: False_
-->

_inlined_description: _









_description: _








<!----------------------------------------------------------------------------->

###void run()

<!--
_syntax: run()_
_name: run_
_returns: void_
_returns_description: _
_parameters: _
_access: private_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_inlined_description: _

runs the user thread function 









_description: _








<!----------------------------------------------------------------------------->

###void sleep(sleepMS)

<!--
_syntax: sleep(sleepMS)_
_name: sleep_
_returns: void_
_returns_description: _
_parameters: int sleepMS_
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_inlined_description: _



tell the thread to sleep for a certain amount of milliseconds

this is useful inside the threadedFunction() when a thread is waiting for input to process:

void myClass::threadedFunction(){ // start

while(isThreadRunning()){

    if(bReadyToProcess == true){

        // do some time intensive processing

        bReadyToProcess = false;
    }
    else{

        // sleep the thread to give up some cpu
        sleep(20);
    }
}

// done
 }

not sleeping the thread means the thread will take 100% of the cpu while it's waiting and will impact performance of your app 







_description: _








<!----------------------------------------------------------------------------->

###void startThread(_blocking = true, _verbose = false)

<!--
_syntax: startThread(_blocking = true, _verbose = false)_
_name: startThread_
_returns: void_
_returns_description: _
_parameters: bool blocking=true, bool verbose=false_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_inlined_description: _



start the thread

set blocking to true if you want the mutex to block on lock()

set verbose to true if you want detailed logging on thread and mutex events 







_description: _


Starts the thread which then calls the threadedFunction().

Set *blocking* to true if you want the [mutex](http://en.wikipedia.org/wiki/Mutex) to block on lock(). See lock() for more detailed info on blocking.

Set *verbose* to true if you want detailed logging on thread and mutex events.







<!----------------------------------------------------------------------------->

###void stopThread(close = true)

<!--
_syntax: stopThread(close = true)_
_name: stopThread_
_returns: void_
_returns_description: _
_parameters: bool close=true_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: True_
_advanced: False_
-->

_inlined_description: _







_description: _


Stop the thread.

Set *close* to true if you want the thread to exit immediately.

Set *close* to false if you want to signal the thread to exit, then wait for it to finish with waitForThread().

**Note**: Calling this function does not guarantee the thread will stop as it may be stuck waiting for a mutex to be unlocked. **Always** make sure to call unlock() if you've previously called lock().







<!----------------------------------------------------------------------------->

###void stopThread()

<!--
_syntax: stopThread()_
_name: stopThread_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0072_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_inlined_description: _

stop the thread 









_description: _








<!----------------------------------------------------------------------------->

###void * thread(*objPtr)

<!--
_syntax: thread(*objPtr)_
_name: thread_
_returns: void *_
_returns_description: _
_parameters: void *objPtr_
_access: protected_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: False_
_visible: False_
_advanced: False_
-->

_inlined_description: _







_description: _








<!----------------------------------------------------------------------------->

###void threadedFunction()

<!--
_syntax: threadedFunction()_
_name: threadedFunction_
_returns: void_
_returns_description: _
_parameters: _
_access: protected_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_inlined_description: _



this is the thread run function

you need to overide this in your derived class and implement your thread stuff inside

if you do not have a loop inside this function, it will run once then exit

if you want the thread to run until you signal it to stop, use a while loop inside that checks if the thread is should keep running:

void myClass::threadedFunction(){ // start

while(isThreadRunning()){

    // do stuff
}

// done
 







_description: _


This is the thread run function, the heart of your thread.

You need to override this in your derived class and implement your thread stuff inside. If you do not have a loop inside this function, it will run once then exit. If you want the thread to run until you signal it to stop, use a while loop inside that checks if the thread is should keep running.

Declaration in a .h file:

~~~~{.cpp}

class MyThread : public ofThread {

	...

	// the thread function
	void MyThread::threadedFunction() {
	
		// start
	
		while(isThreadRunning()) {
	
			// do stuff
		}
	
		// done
	}

};

~~~~

In the .cpp file:

~~~~{.cpp}

void ofApp::setup() {

	// create object
	MyThread thread;
	
	// start the thread
	thread.startThread(true, false);	// blocking, non verbose
}

void ofApp::update() {

	// do something else while the thread is running
}

void ofApp::exit() {
	
	// stop the thread
	thread.stopThread();
}

~~~~







<!----------------------------------------------------------------------------->

###void unlock()

<!--
_syntax: unlock()_
_name: unlock_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_inlined_description: _



unlock the mutex

only unlocks the mutex if it had been locked previously by the calling thread 







_description: _


Unlock the mutex.

This only unlocks the mutex if the calling thread had previously locked it, otherwise the functions does nothing and does not block.







<!----------------------------------------------------------------------------->

###void waitForThread(stop = true)

<!--
_syntax: waitForThread(stop = true)_
_name: waitForThread_
_returns: void_
_returns_description: _
_parameters: bool stop=true_
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_inlined_description: _



wait for the thread to exit

this function waits for the thread to exit before it returns to make sure the thread is cleaned up, otherwise you will get errors on exit

set stop to true if you want to signal the thread to exit before waiting, this is the equivalent to calling stopThread()

set stop to false if you have already signalled the thread to exit by calling stopThread() and only need to wait for it to finish 







_description: _


Waits for the thread to exit.

This function waits for the thread to exit before it returns to make sure the thread is cleaned up, otherwise you will get errors on exit.

Set *stop* to true if you want to signal the thread to exit before waiting, this is the equivalent to calling stopThread(false).

Set *stop* to false if you have already signaled the thread to exit by calling stopThread(false) and only need to wait for it to finish.







<!----------------------------------------------------------------------------->

###void yield()

<!--
_syntax: yield()_
_name: yield_
_returns: void_
_returns_description: _
_parameters: _
_access: public_
_version_started: 0071_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: True_
_advanced: False_
-->

_inlined_description: _



tell the thread to give up the cpu to other threads

this function is similar to sleep() and can be used in the same way, the main difference is that 1 ms is a long time on modern processors and yield() simply gives up processing time to the next thread instead of waiting for a certain amount of time

this can be faster in some circumstances 







_description: _








<!----------------------------------------------------------------------------->

### ~ofThread()

<!--
_syntax: ~ofThread()_
_name: ~ofThread_
_returns: _
_returns_description: _
_parameters: _
_access: public_
_version_started: 007_
_version_deprecated: _
_summary: _
_constant: False_
_static: no_
_visible: False_
_advanced: False_
-->

_inlined_description: _









_description: _








<!----------------------------------------------------------------------------->

##Variables



###bool blocking

<!--
_name: blocking_
_type: bool_
_access: protected_
_version_started: 007_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _


This is true if the thread was started in blocking mode, ie it is using a blocking mutex.







<!----------------------------------------------------------------------------->

###ofMutex mutex

<!--
_name: mutex_
_type: ofMutex_
_access: protected_
_version_started: 007_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _


This is the internal [mutex](http://en.wikipedia.org/wiki/Mutex) called through lock() & unlock(). You can use it manually inside your derived class.







<!----------------------------------------------------------------------------->

###pthread_t myThread

<!--
_name: myThread_
_type: pthread_t_
_access: protected_
_version_started: 007_
_version_deprecated: _
_summary: _
_visible: False_
_constant: True_
_advanced: False_
-->

_description: _








<!----------------------------------------------------------------------------->

###Poco thread

<!--
_name: thread_
_type: Poco_
_access: private_
_version_started: 0071_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _








<!----------------------------------------------------------------------------->

###bool threadRunning

<!--
_name: threadRunning_
_type: bool_
_access: protected_
_version_started: 007_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _


This is the value returned by isThreadRunning().

It is frequently used as a check inside threadedFunction() and setting this to false will exit the function:

~~~~{.cpp}

void MyThread::threadedFunction() {
	
	// start
	
	while(isThreadRunning()) {
		// do stuff until threadRunning == false
	}
	
	// done
}

~~~~







<!----------------------------------------------------------------------------->

###bool verbose

<!--
_name: verbose_
_type: bool_
_access: protected_
_version_started: 007_
_version_deprecated: _
_summary: _
_visible: True_
_constant: True_
_advanced: False_
-->

_description: _


This is true if the thread was started in verbose mode.

This is useful if you want to print special messages inside your derived class for thread debugging.







<!----------------------------------------------------------------------------->


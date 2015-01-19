General Comments
================

Start writing from here.

Some major themes from our Facebook Group:

* Too much focus on writing code as opposed to theory.
* Syntactical Mistakes that caused a lot of confusion.

Various other errors as outlined below:

Question 1
===========

> Mention your comments as a block quote like this. Inserted for your
> convenience before every question.

A class has been defined that deals with the weights of characters in a role playing game using the imperial system (where there are 14 pounds in a stone). The implementations of the operators use only simple integer arithmetic and assume the compiler turns integers into a class constant using the Weight constructor when it is appropriate to do so. The class header file is as follows (you may assume appropriate header guards will be inserted).

    #include <iostream>
    using namespace std;
    
    class Weight
    {
    public:
        Weight(const int = 0, const int = 0);
        Weight(const int = 0);
        int totalPounds();
        Weight operator+(const Weight);
        Weight operator++();
        Weight operator++(int);
        private:
        int stones;
        int pounds
    };

    void operator<<(ostream& os, const Weight&);



> b++ lacking semicolon. This seemed to create a lot of confusion
> since header file was supposed to be the one that was to be fixed.

a) Consider the following segment of code from a main function and
identify which lines of code will result in errors and explain
why. Amend the header file to remove the errors.

    Weight a(12);
    const Weight b(15, 3);
    const int FIXED_WEIGHT = b.totalPounds();
    Weight combined = a + b;
    ++a;

<code class="error">
<!-- Wrap code segments with error as follows so -->
<!-- that they are highlighted in red-->
b++
</code>

    combined = 5 + a;
    a = b + 1;
    cout << a << b;


> nil.

b) Explain why the header file functions contain no formal parameters.

> nil.

c) Explain the purpose of the integer parameters in the declaration Weight operator++(int);

> nil.

d) Complete the class by providing an appropriate weight.cpp file.

Question 2
==========

> nil.

a) Describe the syntax and use of Abstract Classes in C++ with the aid
of an example. Explain what benefits they bring.

> nil.

b) Consider the C++ code below. Explain carefully the order of
Constructor calls and deduce the program's output.

> nil.

c) How will the output change if inheritance is virtual?

> nil.

d) Explain the effect of making the destructor of class Game
non-virtual.

> Deletion of d instead of score.

e) Why is the pattern of inheritance adopted below a dangerous one to
employ?

    class Game {
        Game() {}
            virtual ~Game() { cout << "Game destructor\n";}
    };

    class FirstPerson : public Game {
    public:
    FirstPerson(double d) { score = new double(d); }
    virtual ~FirstPerson() {

<code class="error">
delete d;
</code>

    cout << "FP destructor\n";}
    protected:
    double* score;
    };

    class Shoot : public Game {
    public:
    Shoot(int a) {ammo = new int(a);}
    virtual ~Shoot() {delete ammo; cout << "Shoot destructor\n";}
    protected:
    int* ammo;
    };

    class FPShooter: public Shoot, public FirstPerson {
    public:
    FPShooter(double d, int a):FirstPerson(d), Shoot(a) {}
    virtual ~FPShooter() {cout << "FPShooter destructor\n";}
    };

    void main() {
    Game* g = new FirstPerson(2.7);
    FPShooter* fps = new FPShooter(3.5, 6);
    delete g;
    delete fps;
    }

Question 3
==========

> nil.

a) For each of the following declarations describe the data structure
that results and the state whether data is stored on the stack or the
heap. (You may draw diagrams to clarify your explanations if you
wish).

    int a;
    int *b = new int(5);
    double c[4];
    double *d[4];
    int (*e)[4];
    char *(*f)[];

> nil.

b) Consider the following fragment of code:

    const int LEN = 5;
    int v[LEN];
        int *pv1 = v;
            for(int i = 0; i < LEN; i++) {
                v[i] = i + 1;
    }
        int *pv2 = &v[3];
            int *pv3 = pv1 + 3;

What are the values of *pv1, *pv2 and *pv3?

> nil.

c) What do the different uses of const tell the compiler in the three
declarations below:

    const int *pi1;
    int* const pi2;
    int Boat::maxFuel() const; //Method of Boat class

> upDateVel has the wrong case compared to the one used int he function.

d) A programmer is creating a game in which players race Cars and has
created the following class:

    Class Car {
    public:
        Car();

<code class="error">
void upDateVel(double newVelocity);
</code>

    private:
        double* velocity;
    };

There are never more than 30 cars racing at any one time but there may
be less. A linked list class AllCars has been created and is used by
the following function.

    AllCars* addCar(int noCars) {
        AllCars* list = new AllCars();
    for(int i = 0; i < noOfCars; i++) {
        Car c = new Car();
            list->add(c);
    }
    
    return list;

    }

For testing purposes the programmer uses a random number generator to
alter the velocity for each Car to update it's velocity:

    void testUpdate(AllCars* cars) {
    while(cars->car != NULL) {
    
    double v = rand(); // random no generator
    cars->car->updateVel(v);
        cars->car = cars->car->next;
    }
    }

Propose reasons why this way of updating individual velocities is
inefficient and suggest any possible improvements.

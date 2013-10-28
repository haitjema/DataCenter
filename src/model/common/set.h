//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

#ifndef SET_H_
#define SET_H_

#include "DCCommon.h"
template <typename T> class Set;
template <typename T> std::ostream& operator<<(std::ostream& os, const Set<T>& S);
template <typename T> uint len(const Set<T>& S);
template <typename T> T sum(const Set<T>& S);

template <typename T>
class Set {
protected:
    std::vector<T> items;
public:
    Set() {}
    Set(const Set<T>&);
    inline size_t size() const { return items.size(); }
    virtual ~Set() { clear(); }
    inline void clear() { items.clear(); }
    void copy(const Set<T>& other); // local utility function
    virtual std::string getString() const;
    friend std::ostream& operator<< <>(std::ostream& os, const Set& S);
    // Assignment operator
    Set<T>& operator=( const Set<T>& );
    void add(T item);
    void remove(T item);
    Set<T> set_union( const Set<T>& S ) { return (*this) + S; }
    Set<T> intersection( const Set<T>& S ) { return (*this)-((*this-S)+(S-*this)); }
    T get(uint i) const { return items[i]; }
    inline void remove_idx(uint idx) { remove(items[idx]); }
    // Access operator
    virtual T &operator[](uint i) { return items[i]; }
    Set<T>& operator+=(const T& a);
    Set<T> operator+(const T& a) const { return Set<T>(*this).operator+=(a); }
    Set<T>& operator-=(const T& a);
    Set<T> operator-(const T& a) const { return Set<T>(*this).operator-=(a); }
    // Set addition/subtraction
    Set<T>& operator+=( const Set<T>& );
    Set<T>& operator-=( const Set<T>& );
    Set<T> operator+( const Set<T>& S ) const { return Set<T>(*this).operator+=(S); }
    Set<T> operator-( const Set<T>& S ) const { return Set<T>(*this).operator-=(S); }
    // Assume comparison must hold for all values:
    bool operator==(const Set& S) const;
    bool operator!=(const Set& S) const { return !(Set<T>(*this).operator==(S)); }
};

template<typename T>
Set<T>::Set( const Set<T>& cp ) {
    this->copy(cp);
}
template<typename T>
Set<T>& Set<T>::operator=( const Set<T>& cp ) {
    if (&cp==this) return *this;
    this->copy(cp); return *this;
}
template <typename T>
void Set<T>::copy(const Set<T>& other) {
    items = other.items;
}
template <typename T>
std::string Set<T>::getString() const {
    std::stringstream out;
    out << "{";
    for (uint i = 0; i < items.size(); i++) {
        out << ((i > 0) ? ", " : " ");
        out << items[i];
    } out << " }";
    return out.str();
}
template <typename T>
std::ostream& operator<<(std::ostream& os, const Set<T>& S){ os << S.getString(); return os; }
template <typename T>
void Set<T>::add(T item) {
    typename std::vector<T>::iterator it = find(items.begin(), items.end(), item);
    if (it != items.end()) {}
    else { items.push_back(item); }
}
template <typename T>
void Set<T>::remove(T item) {
    typename std::vector<T>::iterator it = find(items.begin(), items.end(), item);
    if (it == items.end()) { std::cerr << "Item " << item << " not in set " << *this<< endl;
    } else { items.erase(it); }
}

// Operators
template<class T>
Set<T>& Set<T>::operator+=( const T& a ) {
    add(a); return *this;
}
template<class T>
Set<T>& Set<T>::operator-=( const T& a ) {
    remove(a); return *this;
}
template<class T>
bool Set<T>::operator==( const Set<T>& S ) const {
    return items == S.items;
}
template<class T>
Set<T>& Set<T>::operator+=( const Set<T>& S ) {
    for (size_t i = 0; i < S.size(); i++) add(S.get(i));
    return *this;
}
template<class T>
Set<T>& Set<T>::operator-=( const Set<T>& S ) {
    for (size_t i = 0; i < S.size(); i++) remove(S.get(i));
    return *this;
}

#endif /* SET_H_ */

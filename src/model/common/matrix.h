#ifndef MATRIX_H_
#define MATRIX_H_

#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <typeinfo>
#include <string>
#include <sstream>
#include <algorithm>
#include <vector>
#include <map>
#include <cmath>
#include <ctime>
#include <functional>
#include <stdint.h>

// The code for the kahn_sum class was borrowed from "Dr. Dobb's" 
// matrix template class which can be found at the following url:
// http://www.drdobbs.com/a-c-matrix-template-class/184403323
template<class T>
class kahn_sum {     // implements Kahn Summation method
   public:
      //kahn_sum() : sum(0.0), cor(0.0) {}
      kahn_sum() : sum(0), cor(0) {}
      kahn_sum<T>& operator+=( const T& val ) {
         T old_sum = sum;
         T next = val-cor;
         cor = ( (sum += next) - old_sum ) - next;
         return *this;
      }
      kahn_sum<T>& operator-=( const T& val ) {
         T old_sum = sum;
         T next = val+cor;
         cor = ( (sum -= val) - old_sum ) + next;
         return *this;
      }
      operator T&() { return sum; }
   private:
      T sum;  // running sum
      T cor;  // correction term
};

template <typename T> class Matrix;
template <typename T> std::ostream& operator<<(std::ostream& os, const Matrix<T>& M);

template <typename T> T sum(const Matrix<T>& M) { return M.sum(); }
template <typename T> uint len(const Matrix<T>& M) { return max(M.rows(), M.cols()); }

template <typename T> Matrix<T> sum_rows(const Matrix<T>& M) { Matrix<T> RS = M.rowSums(); return RS.transpose(); }
template <typename T> Matrix<T> sum_cols(const Matrix<T>& M) { return M.sumCols(); }

template <typename T> 
class Matrix {
protected:
    typedef std::vector<T> Columns;
    std::vector<Columns *> Rows;
    uint m_, n_;
    T dummy; // returned on invalid access
public:
    Matrix(uint m, uint n);
    Matrix(const Matrix<T>&);
    virtual ~Matrix() { clear(); }
    virtual void resize(uint m, uint n, T initVal) { resize(m, n); initialize(initVal); }
    virtual void resize(uint m, uint n);
    virtual void initialize(T initVal=0);
    virtual void clear();
    void copy(const Matrix<T>& other); // local utility function
    virtual bool check_range(uint i, uint j, bool warn=true);
    virtual bool check_dimensions(const Matrix<T>&, bool warn=true);
    virtual uint rows() const { return m_; }
    virtual uint cols() const { return n_; }
    virtual void set_vij(uint i, uint j, T value);
    virtual T get_vij(uint i, uint j) const;
    virtual T min() const;
    virtual T max() const;
    bool all() const; // no zero values
    virtual T sum() const;
    virtual T sumRow(uint i) const;   // Sum of a single row
    virtual T sumCol(uint j) const;   // Sum of a single column
    Matrix<T> rowSums() const { Matrix<T> M(m_,1); 
        for (uint i = 0; i < m_; i++) { M(i,0) = sumRow(i); } return M; 
    }
    Matrix<T> colSums() const { Matrix<T> M(1,n_);
        for (uint j = 0; j < n_; j++) { M(0,j) = sumCol(j); } return M; 
    }
    Matrix<T> slice(uint i0, uint i1, uint j0, uint j1);
    Matrix<T> transpose();
    virtual std::string getString() const;
    friend std::ostream& operator<< <>(std::ostream& os, const Matrix& M);
    // Assignment operator
    Matrix<T>& operator=( const Matrix<T>& );
    // Access operator
    virtual T &operator[](uint j) { return (*this)(0,j); } // Works like an array... assumes matrix is (1 x n)
    virtual T &operator()(uint i, uint j) { return ((check_range(i,j)) ? (*Rows[i])[j] : dummy); }
    // Operations:
    // Scalar multiplication/division
    Matrix<T>& operator*=( const T& a );
    Matrix<T> operator*( const T& a ) const { return Matrix<T>(*this).operator*=(a); }
    Matrix<T>& operator/=( const T& a );
    Matrix<T> operator/( const T& a ) { return Matrix<T>(*this).operator/=(a); }
    // Scalar addition/subtraction
    Matrix<T>& operator+=(const T& a);
    Matrix<T> operator+(const T& a) const { return Matrix<T>(*this).operator+=(a); }
    Matrix<T>& operator-=(const T& a);
    Matrix<T> operator-(const T& a) const { return Matrix<T>(*this).operator-=(a); }
    // Matrix addition/subtraction
    Matrix<T>& operator+=( const Matrix<T>& );
    Matrix<T>& operator-=( const Matrix<T>& );
    Matrix<T> operator+( const Matrix<T>& M ) const { return Matrix<T>(*this).operator+=(M); }
    Matrix<T> operator-( const Matrix<T>& M ) const { return Matrix<T>(*this).operator-=(M); }
    //Matrix<bool> operator==(const Matrix& M) const;
    // Assume comparison must hold for all values:
    bool operator==(const Matrix& M) const;
    bool operator>=(const Matrix& M) const;
    bool operator<=(const Matrix& M) const;
    bool operator!=(const Matrix& M) const { return !(Matrix<T>(*this).operator==(M));}
    bool operator>(const Matrix& M) const { return !(Matrix<T>(*this).operator<=(M)); }
    bool operator<(const Matrix& M) const { return !(Matrix<T>(*this).operator>=(M)); }
};

template<class T>
class zeros: public Matrix<T> {
public:
    zeros(uint n) : Matrix<T>(1, n) { } 
    zeros(uint m, uint n) : Matrix<T>(m, n) { } 
};
template<class T>
class ones: public Matrix<T> {
public:
    ones(uint n) : Matrix<T>(1, n) { Matrix<T>::initialize(1); } 
    ones(uint m, uint n) : Matrix<T>(m, n) { Matrix<T>::initialize(1); } 
};
template<typename T>
Matrix<T>::Matrix(uint m, uint n) : m_(m), n_(n), dummy(0) {
    this->resize(m,n); this->initialize(0);
};

template<typename T>
Matrix<T>::Matrix( const Matrix<T>& cp ) : m_(cp.rows()), n_(cp.cols()), dummy(0) {
    this->copy(cp);
}
template<typename T>
Matrix<T>& Matrix<T>::operator=( const Matrix<T>& cp ) {
    if (&cp==this) return *this;
    this->copy(cp); return *this;
}   
template<typename T>
bool Matrix<T>::check_range(uint i, uint j, bool warn) {
    //cout << "check_range("<<i<<","<<j<<")"<< " (m_=" << m_ << ", n_=" << n_ << ")" << endl;
    if (i >= m_) {
        opp_error("Matrix<T>::check_range(): (i >= m_");
        if (warn) { 
            std::cerr << "IndexError: index (" << i << ") out of range"
                 << " (0<=index<" << m_ << ") in dimension 0" << endl;
        } return false;
    } else if (j >= n_) {
        opp_error("Matrix<T>::check_range(): (j >= n_");
        if (warn) { 
            std::cerr << "IndexError: index (" << j << ") out of range"
                 << " (0<=index<" << n_ << ") in dimension 1" << endl;
        } return false;
    } return true;
}
template<typename T>
bool Matrix<T>::check_dimensions( const Matrix<T>& M, bool warn) {
    if ((m_ != M.rows()) || (n_ != M.cols())) {
        opp_error("Matrix<T>::check_dimensions()");
        if (warn) {
            std::cerr << "Dimension mismatch!"
                 << "(" << m_ << ", " << n_ << ")" << " != "
                 << "(" << M.rows() << ", " << M.cols() << ")" << endl;
        } return false;
    } return true;
}
template <typename T>
void Matrix<T>::clear() {
    for (uint i = 0; i < Rows.size(); i++) { delete Rows[i]; Rows[i] = NULL; }
    Rows.clear();
}
template <typename T> 
void Matrix<T>::initialize(T val) {
    for (uint i = 0; i < m_; i++)
        for (uint j = 0; j < n_; j++) { (*this)(i,j) = val; } //set_vij(0,0,val); }
}
template <typename T> 
void Matrix<T>::resize(uint m, uint n) {
    m_ = m; n_ = n;
    //cout << "Resizing to ("  << m << ", " << n << ")" << endl;
    clear(); Rows.resize(m);
    for (uint i = 0; i < m; i++) {
        Rows[i] = new Columns;
        (*Rows[i]).resize(n);  
    }
}
template <typename T> 
void Matrix<T>::copy(const Matrix<T>& other) {
    uint m = other.rows(); uint n = other.cols(); resize(m,n);
    for (uint i = 0; i < m; i++)
        for (uint j = 0; j < n; j++) { set_vij(i,j, other.get_vij(i,j)); }
}
template <typename T> 
void Matrix<T>::set_vij(uint i, uint j, T value) {
    if (i >= m_ || j >= n_) {
        printf("set_vij(%d,%d): matrix is of size (%d, %d)!", i, j, m_, n_);
        return;
    } (*Rows[i])[j] = value;
}
template <typename T> T 
Matrix<T>::get_vij(uint i, uint j) const {
    if (i >= m_ || j >= n_) {
        printf("get_vij(%d,%d): matrix is of size (%d, %d)!", i, j, m_, n_);
        return 0;
    } return (*Rows[i])[j];
}
template <typename T> 
std::string Matrix<T>::getString() const {   
    std::stringstream out; // Python numpy style output
    for (uint i = 0; i < m_; i++) {
        Columns & col = *Rows[i]; 
        out << ((i > 0) ? " [" : "[[");
        for (uint j = 0; j < n_; j++) { 
            out << ((j)?"\t":" ") << col[j];
        } out << ((i < (m_-1)) ? " ]" : " ]]");
        out << endl;
    } return out.str();
}
template<class T>
Matrix<T> Matrix<T>::slice(uint i0, uint i1, uint j0, uint j1) {
    Matrix<T> M(i1 - i0, j1 - j0);
    for (uint i = i0; i < i1; i++)
        for (uint j = j0; j < j1; j++) { M(i-i0,j-j0) = get_vij(i,j); }
    return M;
}
template<class T>
Matrix<T> Matrix<T>::transpose() {
    Matrix<T> M(n_, m_);
    for (uint j = 0; j < m_; j++)
        for (uint i = 0; i < n_; i++) { M(i,j) = get_vij(j,i); }
    return M;
}
template<class T>
T Matrix<T>::min() const {
    T min_val = get_vij(0,0);
    for (uint i = 0; i < m_; i++) {
        for (uint j = 0; j < n_; j++) { 
            if (get_vij(i,j) < min_val) min_val = get_vij(i,j);
        }
    } return min_val;
}
template<class T>
T Matrix<T>::max() const {
    T max_val = get_vij(0,0);
    for (uint i = 0; i < m_; i++) {
        for (uint j = 0; j < n_; j++) { 
            if (get_vij(i,j) > max_val) max_val = get_vij(i,j);
        }
    } return max_val;
}
template<class T>
bool Matrix<T>::all() const {
    for (uint i = 0; i < m_; i++) {
        for (uint j = 0; j < n_; j++) { 
            if (!get_vij(i,j)) return false;
        }
    } return true;
}
template<class T>
T Matrix<T>::sum() const {
    //T sum_val = 0;
    kahn_sum<T> sum_val;
    for (uint i = 0; i < m_; i++) {
        for (uint j = 0; j < n_; j++) { 
            sum_val += get_vij(i,j);
        }
    } return sum_val;
}
template<class T>
T Matrix<T>::sumRow(uint i) const {
    //T sum_val = 0;
    kahn_sum<T> sum_val;
    for (uint j = 0; j < n_; j++) { 
        sum_val += get_vij(i,j);
    } return sum_val;
}
template<class T>
T Matrix<T>::sumCol(uint j) const {
    //T sum_val = 0;
    kahn_sum<T> sum_val;
    for (uint i = 0; i < m_; i++) { 
        sum_val += get_vij(i,j);
    } return sum_val;
}
// Operators
template <typename T> 
std::ostream& operator<<(std::ostream& os, const Matrix<T>& M){
    os << M.getString(); return os;
}
template<class T>
Matrix<T>& Matrix<T>::operator*=( const T& a ) {
    for (uint i = 0; i < m_; i++)
        for (uint j = 0; j < n_; j++) { (*this)(i,j) *= a; }
    return *this;
}
template<class T>
Matrix<T>& Matrix<T>::operator/=( const T& a ) {
    for (uint i = 0; i < m_; i++)
        for (uint j = 0; j < n_; j++) { (*this)(i,j) /= a; }
    return *this;
}
template<class T>
Matrix<T>& Matrix<T>::operator+=( const T& a ) {
    for (uint i = 0; i < m_; i++)
        for (uint j = 0; j < n_; j++) { (*this)(i,j) += a; }
    return *this;
}
template<class T>
Matrix<T>& Matrix<T>::operator-=( const T& a ) {
    for (uint i = 0; i < m_; i++)
        for (uint j = 0; j < n_; j++) { (*this)(i,j) -= a; }
    return *this;
}
template<class T>
bool Matrix<T>::operator==( const Matrix<T>& M ) const {
    for (uint i = 0; i < m_; i++) {
        for (uint j = 0; j < n_; j++) { 
            //if (get_vij(i,j) != M.get_vij(i,j)) return false;
            //if (fabs((double)(get_vij(i,j) - M.get_vij(i,j))) > TOLERANCE) return false;
            if (!approx_equal((double)get_vij(i,j), (double)M.get_vij(i,j))) return false;
        }
    } return true;
}
template<class T>
bool Matrix<T>::operator>=( const Matrix<T>& M ) const {
    for (uint i = 0; i < m_; i++) {
        for (uint j = 0; j < n_; j++) { 
            if (!approx_gte((double)get_vij(i,j), (double)M.get_vij(i,j))) return false;
        }
    } return true;
}
template<class T>
bool Matrix<T>::operator<=( const Matrix<T>& M ) const {
    for (uint i = 0; i < m_; i++) {
        for (uint j = 0; j < n_; j++) { 
            if (!approx_lte((double)get_vij(i,j), (double)M.get_vij(i,j))) return false;
        }
    } return true;
}
template<class T>
Matrix<T>& Matrix<T>::operator+=( const Matrix<T>& M ) {
    if (!check_dimensions(M, true)) return *this;
    for (uint i = 0; i < m_; i++)
        for (uint j = 0; j < n_; j++) { (*this)(i,j) += M.get_vij(i,j); }
    return *this;
}
template<class T>
Matrix<T>& Matrix<T>::operator-=( const Matrix<T>& M ) {
    if (!check_dimensions(M, true)) return *this;
    for (uint i = 0; i < m_; i++)
        for (uint j = 0; j < n_; j++) { (*this)(i,j) -= M.get_vij(i,j); }
    return *this;
}


#endif // MATRIX_H_

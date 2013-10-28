//
// Generated file, do not edit! Created by opp_msgc 4.3 from model/node/schedulingLayer/proxy/RequestPacket.msg.
//

// Disable warnings about unused variables, empty switch stmts, etc:
#ifdef _MSC_VER
#  pragma warning(disable:4101)
#  pragma warning(disable:4065)
#endif

#include <iostream>
#include <sstream>
#include "RequestPacket_m.h"

// Template rule which fires if a struct or class doesn't have operator<<
template<typename T>
std::ostream& operator<<(std::ostream& out,const T&) {return out;}

// Another default rule (prevents compiler from choosing base class' doPacking())
template<typename T>
void doPacking(cCommBuffer *, T& t) {
    throw cRuntimeError("Parsim error: no doPacking() function for type %s or its base class (check .msg and _m.cc/h files!)",opp_typename(typeid(t)));
}

template<typename T>
void doUnpacking(cCommBuffer *, T& t) {
    throw cRuntimeError("Parsim error: no doUnpacking() function for type %s or its base class (check .msg and _m.cc/h files!)",opp_typename(typeid(t)));
}




RequestPacket_Base::RequestPacket_Base(const char *name, int kind) : SchedulingPacket(name,kind)
{
    this->setSchedPktType(SCHEDULING_REQUEST);

}

RequestPacket_Base::RequestPacket_Base(const RequestPacket_Base& other) : SchedulingPacket(other)
{
    copy(other);
}

RequestPacket_Base::~RequestPacket_Base()
{
}

RequestPacket_Base& RequestPacket_Base::operator=(const RequestPacket_Base& other)
{
    if (this==&other) return *this;
    SchedulingPacket::operator=(other);
    copy(other);
    return *this;
}

void RequestPacket_Base::copy(const RequestPacket_Base& other)
{
    this->request_var = other.request_var;
    this->bklg_var = other.bklg_var;
}

void RequestPacket_Base::parsimPack(cCommBuffer *b)
{
    SchedulingPacket::parsimPack(b);
    doPacking(b,this->request_var);
    doPacking(b,this->bklg_var);
}

void RequestPacket_Base::parsimUnpack(cCommBuffer *b)
{
    SchedulingPacket::parsimUnpack(b);
    doUnpacking(b,this->request_var);
    doUnpacking(b,this->bklg_var);
}

rate_t& RequestPacket_Base::getRequest()
{
    return request_var;
}

void RequestPacket_Base::setRequest(const rate_t& request)
{
    this->request_var = request;
}

bklg_t& RequestPacket_Base::getBklg()
{
    return bklg_var;
}

void RequestPacket_Base::setBklg(const bklg_t& bklg)
{
    this->bklg_var = bklg;
}

class RequestPacketDescriptor : public cClassDescriptor
{
  public:
    RequestPacketDescriptor();
    virtual ~RequestPacketDescriptor();

    virtual bool doesSupport(cObject *obj) const;
    virtual const char *getProperty(const char *propertyname) const;
    virtual int getFieldCount(void *object) const;
    virtual const char *getFieldName(void *object, int field) const;
    virtual int findField(void *object, const char *fieldName) const;
    virtual unsigned int getFieldTypeFlags(void *object, int field) const;
    virtual const char *getFieldTypeString(void *object, int field) const;
    virtual const char *getFieldProperty(void *object, int field, const char *propertyname) const;
    virtual int getArraySize(void *object, int field) const;

    virtual std::string getFieldAsString(void *object, int field, int i) const;
    virtual bool setFieldAsString(void *object, int field, int i, const char *value) const;

    virtual const char *getFieldStructName(void *object, int field) const;
    virtual void *getFieldStructPointer(void *object, int field, int i) const;
};

Register_ClassDescriptor(RequestPacketDescriptor);

RequestPacketDescriptor::RequestPacketDescriptor() : cClassDescriptor("RequestPacket", "SchedulingPacket")
{
}

RequestPacketDescriptor::~RequestPacketDescriptor()
{
}

bool RequestPacketDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<RequestPacket_Base *>(obj)!=NULL;
}

const char *RequestPacketDescriptor::getProperty(const char *propertyname) const
{
    if (!strcmp(propertyname,"customize")) return "true";
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int RequestPacketDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 2+basedesc->getFieldCount(object) : 2;
}

unsigned int RequestPacketDescriptor::getFieldTypeFlags(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeFlags(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static unsigned int fieldTypeFlags[] = {
        FD_ISCOMPOUND,
        FD_ISCOMPOUND,
    };
    return (field>=0 && field<2) ? fieldTypeFlags[field] : 0;
}

const char *RequestPacketDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "request",
        "bklg",
    };
    return (field>=0 && field<2) ? fieldNames[field] : NULL;
}

int RequestPacketDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='r' && strcmp(fieldName, "request")==0) return base+0;
    if (fieldName[0]=='b' && strcmp(fieldName, "bklg")==0) return base+1;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *RequestPacketDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "rate_t",
        "bklg_t",
    };
    return (field>=0 && field<2) ? fieldTypeStrings[field] : NULL;
}

const char *RequestPacketDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldProperty(object, field, propertyname);
        field -= basedesc->getFieldCount(object);
    }
    switch (field) {
        default: return NULL;
    }
}

int RequestPacketDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    RequestPacket_Base *pp = (RequestPacket_Base *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string RequestPacketDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    RequestPacket_Base *pp = (RequestPacket_Base *)object; (void)pp;
    switch (field) {
        case 0: {std::stringstream out; out << pp->getRequest(); return out.str();}
        case 1: {std::stringstream out; out << pp->getBklg(); return out.str();}
        default: return "";
    }
}

bool RequestPacketDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    RequestPacket_Base *pp = (RequestPacket_Base *)object; (void)pp;
    switch (field) {
        default: return false;
    }
}

const char *RequestPacketDescriptor::getFieldStructName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldStructNames[] = {
        "rate_t",
        "bklg_t",
    };
    return (field>=0 && field<2) ? fieldStructNames[field] : NULL;
}

void *RequestPacketDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    RequestPacket_Base *pp = (RequestPacket_Base *)object; (void)pp;
    switch (field) {
        case 0: return (void *)(&pp->getRequest()); break;
        case 1: return (void *)(&pp->getBklg()); break;
        default: return NULL;
    }
}



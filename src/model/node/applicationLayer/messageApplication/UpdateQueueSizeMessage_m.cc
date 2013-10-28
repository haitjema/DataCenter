//
// Generated file, do not edit! Created by opp_msgc 4.3 from model/node/applicationLayer/messageApplication/UpdateQueueSizeMessage.msg.
//

// Disable warnings about unused variables, empty switch stmts, etc:
#ifdef _MSC_VER
#  pragma warning(disable:4101)
#  pragma warning(disable:4065)
#endif

#include <iostream>
#include <sstream>
#include "UpdateQueueSizeMessage_m.h"

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




Register_Class(UpdateQueueSizeMessage);

UpdateQueueSizeMessage::UpdateQueueSizeMessage(const char *name, int kind) : ControlMessage(name,kind)
{
    this->setType(UPDATE_QUEUE_SIZE_MSG);

    this->queueSizePkts_var = 0;
    this->queueSizeBytes_var = 0;
}

UpdateQueueSizeMessage::UpdateQueueSizeMessage(const UpdateQueueSizeMessage& other) : ControlMessage(other)
{
    copy(other);
}

UpdateQueueSizeMessage::~UpdateQueueSizeMessage()
{
}

UpdateQueueSizeMessage& UpdateQueueSizeMessage::operator=(const UpdateQueueSizeMessage& other)
{
    if (this==&other) return *this;
    ControlMessage::operator=(other);
    copy(other);
    return *this;
}

void UpdateQueueSizeMessage::copy(const UpdateQueueSizeMessage& other)
{
    this->queueSizePkts_var = other.queueSizePkts_var;
    this->queueSizeBytes_var = other.queueSizeBytes_var;
}

void UpdateQueueSizeMessage::parsimPack(cCommBuffer *b)
{
    ControlMessage::parsimPack(b);
    doPacking(b,this->queueSizePkts_var);
    doPacking(b,this->queueSizeBytes_var);
}

void UpdateQueueSizeMessage::parsimUnpack(cCommBuffer *b)
{
    ControlMessage::parsimUnpack(b);
    doUnpacking(b,this->queueSizePkts_var);
    doUnpacking(b,this->queueSizeBytes_var);
}

long UpdateQueueSizeMessage::getQueueSizePkts() const
{
    return queueSizePkts_var;
}

void UpdateQueueSizeMessage::setQueueSizePkts(long queueSizePkts)
{
    this->queueSizePkts_var = queueSizePkts;
}

long UpdateQueueSizeMessage::getQueueSizeBytes() const
{
    return queueSizeBytes_var;
}

void UpdateQueueSizeMessage::setQueueSizeBytes(long queueSizeBytes)
{
    this->queueSizeBytes_var = queueSizeBytes;
}

class UpdateQueueSizeMessageDescriptor : public cClassDescriptor
{
  public:
    UpdateQueueSizeMessageDescriptor();
    virtual ~UpdateQueueSizeMessageDescriptor();

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

Register_ClassDescriptor(UpdateQueueSizeMessageDescriptor);

UpdateQueueSizeMessageDescriptor::UpdateQueueSizeMessageDescriptor() : cClassDescriptor("UpdateQueueSizeMessage", "ControlMessage")
{
}

UpdateQueueSizeMessageDescriptor::~UpdateQueueSizeMessageDescriptor()
{
}

bool UpdateQueueSizeMessageDescriptor::doesSupport(cObject *obj) const
{
    return dynamic_cast<UpdateQueueSizeMessage *>(obj)!=NULL;
}

const char *UpdateQueueSizeMessageDescriptor::getProperty(const char *propertyname) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? basedesc->getProperty(propertyname) : NULL;
}

int UpdateQueueSizeMessageDescriptor::getFieldCount(void *object) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    return basedesc ? 2+basedesc->getFieldCount(object) : 2;
}

unsigned int UpdateQueueSizeMessageDescriptor::getFieldTypeFlags(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeFlags(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static unsigned int fieldTypeFlags[] = {
        FD_ISEDITABLE,
        FD_ISEDITABLE,
    };
    return (field>=0 && field<2) ? fieldTypeFlags[field] : 0;
}

const char *UpdateQueueSizeMessageDescriptor::getFieldName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldNames[] = {
        "queueSizePkts",
        "queueSizeBytes",
    };
    return (field>=0 && field<2) ? fieldNames[field] : NULL;
}

int UpdateQueueSizeMessageDescriptor::findField(void *object, const char *fieldName) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    int base = basedesc ? basedesc->getFieldCount(object) : 0;
    if (fieldName[0]=='q' && strcmp(fieldName, "queueSizePkts")==0) return base+0;
    if (fieldName[0]=='q' && strcmp(fieldName, "queueSizeBytes")==0) return base+1;
    return basedesc ? basedesc->findField(object, fieldName) : -1;
}

const char *UpdateQueueSizeMessageDescriptor::getFieldTypeString(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldTypeString(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldTypeStrings[] = {
        "long",
        "long",
    };
    return (field>=0 && field<2) ? fieldTypeStrings[field] : NULL;
}

const char *UpdateQueueSizeMessageDescriptor::getFieldProperty(void *object, int field, const char *propertyname) const
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

int UpdateQueueSizeMessageDescriptor::getArraySize(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getArraySize(object, field);
        field -= basedesc->getFieldCount(object);
    }
    UpdateQueueSizeMessage *pp = (UpdateQueueSizeMessage *)object; (void)pp;
    switch (field) {
        default: return 0;
    }
}

std::string UpdateQueueSizeMessageDescriptor::getFieldAsString(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldAsString(object,field,i);
        field -= basedesc->getFieldCount(object);
    }
    UpdateQueueSizeMessage *pp = (UpdateQueueSizeMessage *)object; (void)pp;
    switch (field) {
        case 0: return long2string(pp->getQueueSizePkts());
        case 1: return long2string(pp->getQueueSizeBytes());
        default: return "";
    }
}

bool UpdateQueueSizeMessageDescriptor::setFieldAsString(void *object, int field, int i, const char *value) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->setFieldAsString(object,field,i,value);
        field -= basedesc->getFieldCount(object);
    }
    UpdateQueueSizeMessage *pp = (UpdateQueueSizeMessage *)object; (void)pp;
    switch (field) {
        case 0: pp->setQueueSizePkts(string2long(value)); return true;
        case 1: pp->setQueueSizeBytes(string2long(value)); return true;
        default: return false;
    }
}

const char *UpdateQueueSizeMessageDescriptor::getFieldStructName(void *object, int field) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructName(object, field);
        field -= basedesc->getFieldCount(object);
    }
    static const char *fieldStructNames[] = {
        NULL,
        NULL,
    };
    return (field>=0 && field<2) ? fieldStructNames[field] : NULL;
}

void *UpdateQueueSizeMessageDescriptor::getFieldStructPointer(void *object, int field, int i) const
{
    cClassDescriptor *basedesc = getBaseClassDescriptor();
    if (basedesc) {
        if (field < basedesc->getFieldCount(object))
            return basedesc->getFieldStructPointer(object, field, i);
        field -= basedesc->getFieldCount(object);
    }
    UpdateQueueSizeMessage *pp = (UpdateQueueSizeMessage *)object; (void)pp;
    switch (field) {
        default: return NULL;
    }
}



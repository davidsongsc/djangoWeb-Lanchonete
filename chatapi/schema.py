import graphene

class MessageType(graphene.ObjectType):
    text = graphene.String()
    sender = graphene.String()

class Query(graphene.ObjectType):
    messages = graphene.List(MessageType)

    def resolve_messages(self, info):
        # Obter as mensagens do banco de dados
        return [{'text': 'Hello World', 'sender': 'User 1'},
                {'text': 'Hi there!', 'sender': 'User 2'}]

class CreateMessageMutation(graphene.Mutation):
    class Arguments:
        text = graphene.String()
        sender = graphene.String()

    success = graphene.Boolean()
    message = graphene.Field(MessageType)

    def mutate(self, info, text, sender):
        # Armazene a mensagem no banco de dados
        message = {'text': text, 'sender': sender}
        return CreateMessageMutation(success=True, message=message)

class Mutation(graphene.ObjectType):
    create_message = CreateMessageMutation.Field()

schema = graphene.Schema(query=Query, mutation=Mutation)
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arshadow.elang.syntaxhighlighter;

import com.arshadow.elang.syntaxhighlighter.utils.AntlrCharStream;
import com.arshadow.elang.syntaxhighlighter.utils.eLexer;
import java.util.logging.Logger;
import org.netbeans.api.lexer.Token;
import org.netbeans.spi.lexer.Lexer;
import org.netbeans.spi.lexer.LexerRestartInfo;

/**
 *
 * @author SShadow
 */
public class EEditorLexer implements Lexer<ETokenId> {

    private final static Logger LOGGER = Logger.getLogger(EEditorLexer.class.getName());
    private LexerRestartInfo<ETokenId> info;
    private eLexer lexer;

    public EEditorLexer(LexerRestartInfo<ETokenId> info) {
        this.info = info;
        AntlrCharStream charStream = new AntlrCharStream(info.input(), "EEditor",true);
        lexer = new eLexer(charStream);
    }

    @Override
    public Token<ETokenId> nextToken() {
        org.antlr.runtime.Token token = lexer.nextToken();

        System.out.println("Token: "+token.getText()+ " - type: "+token.getType());
        Token<ETokenId> createdToken = null;

        if (token.getType() != -1) {
            ETokenId tokenId = ELanguageHierarchy.getToken(token.getType());
            System.out.println("+++++++++++++++++>"+tokenId.name()+"-"+tokenId.primaryCategory());
            createdToken = info.tokenFactory().createToken(tokenId);
        } else if (info.input().readLength() > 0) {
            ETokenId tokenId = ELanguageHierarchy.getToken(eLexer.WS);
            createdToken = info.tokenFactory().createToken(tokenId);
        }

        return createdToken;

    }

    @Override
    public Object state() {
        return null;
    }

    @Override
    public void release() {
    }
}

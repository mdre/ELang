/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.arshadow.elang.syntaxhighlighter;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;
import org.netbeans.api.lexer.Language;
import org.netbeans.spi.lexer.LanguageHierarchy;
import org.netbeans.spi.lexer.Lexer;
import org.netbeans.spi.lexer.LexerRestartInfo;

/**
 *
 * @author SShadow
 */
public class ELanguageHierarchy extends LanguageHierarchy<ETokenId> {

    private final static Logger LOGGER = Logger.getLogger(ELanguageHierarchy.class.getName());
    private static List<ETokenId> tokens;
    private static Map<Integer, ETokenId> idToToken;
    private static final Language<ETokenId> language = new ELanguageHierarchy().language();

    public static Language<ETokenId> getLanguage() {
        return language;
    }

    /**
     * Initializes the list of tokens with IDs generated from the ANTLR token file.
     */
    private static void init() {
        AntlrTokenReader reader = new AntlrTokenReader();
        tokens = reader.readTokenFile();
        idToToken = new HashMap<Integer, ETokenId>();
        for (ETokenId token : tokens) {
            if (idToToken.containsKey(token.ordinal())) {
                System.out.println("----> duplicado: "+idToToken.get(token.ordinal()).name()+" vs "+token.name());
//                idToToken.put(token.ordinal()*1000, token);
            } else {
                idToToken.put(token.ordinal(), token);
            }
        }
    }

    /**
     * Returns an actual CMinusTokenId from an id. This essentially allows the syntax highlighter to decide the color of specific words.
     *
     * @param id
     * @return
     */
    static synchronized ETokenId getToken(int id) {
        if (idToToken == null) {
            init();
        }
        return idToToken.get(id);
    }

    @Override
    protected Collection<ETokenId> createTokenIds() {
        if (tokens == null) {
            init();
        }
        return tokens;
    }

    @Override
    protected Lexer<ETokenId> createLexer(LexerRestartInfo<ETokenId> lri) {
        return new EEditorLexer(lri);
    }

    @Override
    protected String mimeType() {
        return "text/x-e";
    }
}
